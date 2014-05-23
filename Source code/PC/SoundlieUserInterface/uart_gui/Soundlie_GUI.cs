/**
* @file Form1.cs
* @brief Main file for the Soundlie GUI. 
* @details GUI developed for the Soundlie project @ Chalmers 2014.
* @author Jonas Andersson
* @version 1.0
*/ 

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;


namespace uart_gui
{
    /**
    * \brief Form1 GUI class
    *
    * Form1 class mapping all the GUI functionality0.
    */
    public partial class Soundlie_GUI : Form
    {

        public const Int16 MAX_FILTER_ORDER = 5; ///< maximum number of filter taps
        public const Int16 MAX_BASS_FREQ = 10000; ///< highest BASS (LP) filter frequency
        public const Int16 MAX_TREBLE_FREQ = 30000; ///< highest TREBLE (HP) filter frequency
        public const Int32 MAX_SAMPLING_FREQ = 50000; ///< highest sampling frequency
        public const Int32 MAX_ECHO_DELAY = 48000; ///< highest ECHO delay
        public const Char EOS = 'x'; ///< end-of-sequency used for the UART message

        enum Filter_type { BASS, MIDDLE, TREBLE }; ///< Filter enum for the different filter types

        /**
        * \brief Filter class.
        *
        * Filter class used for an iir filter tap calculation. Using the matlab MPLAB COM object to calculate the filter taps.
        */
        class Filter
        {
            Filter_type _ft;
            Int16 _num_taps;
            Int16 _data_length = 0;
            Char[] _data = new Char[100];
            public Filter(Filter_type ft, Int16 num_taps)
            {
                this._ft = ft;
                this._num_taps = num_taps;
            }

            /**
             * Adds new iir filter taps to the class variable _data. 
             * The taps are stored in a modified SREC format.
             * The taps are converted from float representation to four char variables.
             * @param  [in] x_arr    array containing the iir filter x values.
             * @param  [in] y_arr    array containing the iir filter y values.
            */
            public void addFilterTap(double[,] x_arr, double[,] y_arr)
            {
                foreach (double tap in x_arr)
                {
                    int int_repr_tap = frac2int((float)tap); 
                    _data[_data_length++] = Convert.ToChar((int_repr_tap >> 12) & 0x000F);
                    _data[_data_length++] = Convert.ToChar(((int_repr_tap & 0x0FFF) >> 8) & 0x000F);
                    _data[_data_length++] = Convert.ToChar(((int_repr_tap & 0x00F0) >> 4) & 0x000F);
                    _data[_data_length++] = Convert.ToChar((int_repr_tap & 0x000F) & 0x000F);
                }

                foreach (double tap in y_arr)
                {
                    int int_repr_tap = frac2int((float)tap);
                    _data[_data_length++] = Convert.ToChar((int_repr_tap >> 12) & 0x000F);
                    _data[_data_length++] = Convert.ToChar(((int_repr_tap & 0x0FFF) >> 8) & 0x000F);
                    _data[_data_length++] = Convert.ToChar(((int_repr_tap & 0x00F0) >> 4) & 0x000F);
                    _data[_data_length++] = Convert.ToChar((int_repr_tap & 0x000F) & 0x000F);
                }
                //Int16 x = 258;
                //Console.Write("16-13: {0}\n", Convert.ToChar((x >> 12) + 0x30));
                //Console.Write("12-9: {0}\n", Convert.ToChar(((x & 0x0FFF) >> 8) + 0x30));
                //Console.Write("8-5: {0}\n", Convert.ToChar(((x & 0x00F0) >> 4) + 0x30));
                //Console.Write("4-1: {0}\n", Convert.ToChar((x & 0x000F) + 0x30));
            }

            /**
             * Prints the filter taps. 
            */
            public void printData()
            {
                int num = _num_taps * 2 * 4;
                for (int i = 0; i < num; i+=4)
                {
                    Console.WriteLine("{0} {1} {2} {3}", inttochar(_data[i]), inttochar(_data[i + 1]), inttochar(_data[i + 2]), inttochar(_data[i + 3]));
                }
            }

            /**
             * Calculate and send the Filter taps in a modified SREC format using the SerialPort Class. 
             * @return a char array containing the formatted filter message.
            */
            public char[] sendFilterFreqData()
            {
                Char[] _tx_data = new Char[_data_length+9]; // header = 2, bit count = 2, address = 2, data = x, checksum = 2, eos = 1
                int check_sum = 0;
                int byte_count = _data_length + 5;
                check_sum += byte_count; // byte count
                check_sum += 0; // address
                for (int i = 0; i < _data_length; i += 2)
                {
                    check_sum += _data[i] * 16 + _data[i + 1]; // add the filter taps to the check sum
                }

                _tx_data[0] = 'S'; // message header
                switch (_ft)
                {
                    case Filter_type.BASS:
                        _tx_data[1] = '0';
                        break;
                    case Filter_type.MIDDLE:
                        _tx_data[1] = '1';
                        break;
                    case Filter_type.TREBLE:
                        _tx_data[1] = '2';
                        break;
                }
           
                _tx_data[2] = inttochar(((Int16)byte_count >> 4) & 0x000F); // message length (first char)
                _tx_data[3] = inttochar((Int16)byte_count & 0x000F); // message length (second char)
                _tx_data[4] = '0'; // message address field (1)
                _tx_data[5] = '0'; // message address field (2)

                // add the filter taps to the message
                for (int i = 0; i < _data_length; i++)
                {
                    _tx_data[6 + i] = inttochar(_data[i]);
                }

                // add the check sum to the message
                _tx_data[_data_length + 6] = inttochar(((byte)~check_sum >> 4) & 0x000F);
                _tx_data[_data_length + 7] = inttochar((byte)~check_sum & 0x000F);
                
                // add the end-of-message character
                _tx_data[_data_length + 8] = EOS;

                // return the formatted message
                return _tx_data;                
            }
        }

        ///////////////////
        // GUI FUNCTIONS //
        ///////////////////
        public MLApp.MLApp matlab; ///< MatLAB COM object
        public Soundlie_GUI()
        {
            InitializeComponent();
            updateApp();

            System.Globalization.CultureInfo customCulture = (System.Globalization.CultureInfo)System.Threading.Thread.CurrentThread.CurrentCulture.Clone();
            customCulture.NumberFormat.NumberDecimalSeparator = ".";
            System.Threading.Thread.CurrentThread.CurrentCulture = customCulture;

            // Add a preset of Baudrates
            cmbBaudRate.Items.Add(300);
            cmbBaudRate.Items.Add(600);
            cmbBaudRate.Items.Add(1200);
            cmbBaudRate.Items.Add(2400);
            cmbBaudRate.Items.Add(9600);
            cmbBaudRate.Items.Add(14400);
            cmbBaudRate.Items.Add(19200);
            cmbBaudRate.Items.Add(38400);
            cmbBaudRate.Items.Add(57600);
            cmbBaudRate.Items.Add(115200);

            // Set default fields for the text boxes
            txtBassFreq.Text = "300";
            txtOrder.Text = "2";
            txtSamplingFreq.Text = "48000";
            txtTrebleFreq.Text = "2400";

            txtAmpBass.Text = "4000";
            txtAmpMiddle.Text = "1000";
            txtAmpTreble.Text = "1000";

            // Launch the MatLAB COM object
            matlab = new MLApp.MLApp();
            matlab.Visible = 0;
        }

        /**
            * Button cunnect function, connects to com port using the SerialPort class. 
        */
        private void btnConnect_Click(object sender, EventArgs e)
        {
            
            string comPortName = cmbCOMports.Text;
            
            if (comPortName == "")
            {
                printLog("Select a valid COM port\n");
            }
            else
            {
                if (cmbCOMports.Items.Count > 0)
                {
                    
                    if (serialPort.IsOpen)
                    {
                        printLog(cmbCOMports.Text + " already opened\n");
                    }
                    else
                    {
                        int baudRate;
                      
                        // parse the baudrate text field
                        bool result = Int32.TryParse(cmbBaudRate.Text, out baudRate);

                        // the inputted baudrate is an interger value
                        if (result)
                            serialPort.BaudRate = baudRate;
                        else
                            printLog("Invalid Baud rate\n");
                        
                        serialPort.PortName = comPortName;
                        
                        // Open the SerialPort connection
                        serialPort.Open();

                        printLog("Connecting to " + comPortName + "\n");
                    }

                }
                else
                {
                    printLog("No COM port found\n");
                }
            }
            // Update the GUI functionallity
            updateApp();
        }

        /**
            * Send manually entered data on the COM port. 
        */
        private void btnSend_Click(object sender, EventArgs e)
        {
            if (serialPort.IsOpen)
            {
                printLog("Sending data: " + txtInput.Text + "\n");
                
                // Write data on the serial port
                serialPort.Write(txtInput.Text);
            }
            else
            {
                printLog("Cannot sent, not connected\n");
            }

            // Update the GUI functionallity
            updateApp();
        }

        /**
            * Clear the message log. 
        */
        private void btnClearLog_Click(object sender, EventArgs e)
        {
            txtLog.Clear();

            // Update the GUI functionallity
            updateApp();
        }

        /**
            * GUI application closed. 
        */
        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            matlab.Quit();
            serialPort.Close();
        }

        /**
            * Update the available COM ports when drop down buttom used. 
        */
        private void cmbCOMports_DropDown(object sender, EventArgs e)
        {
            // Get the availavle com port names
            string[] ports = SerialPort.GetPortNames();
            
            // Clear the com port list from old data
            cmbCOMports.Items.Clear();

            // Add the new com ports to the list
            foreach (string s in ports)
            {
                cmbCOMports.Items.Add(s);
            }

            // Update the GUI functionality
            updateApp();
        }

        /**
            * Send new Echo sound effect data on the serial port. 
        */
        private void btnEcho_Click(object sender, EventArgs e)
        {
            UInt16 delay;
            float dryamp, wetamp;
            
            // Check the format of the user inputted data
            if (UInt16.TryParse(txtDelay.Text, out delay) &&
                Convert.ToInt32(txtDelay.Text) > 0 &&
                Convert.ToInt32(txtDelay.Text) <= MAX_ECHO_DELAY)
            {
                if (float.TryParse(txtDryAmp.Text, out dryamp) && dryamp > 0 && dryamp <= 1)
                {
                    if (float.TryParse(txtWetAmp.Text, out wetamp) && wetamp > 0 && wetamp <= 1)
                    {
                        if (dryamp + wetamp < 1)
                        {
                            // Format and send the ECHO data
                            send_echo(delay, dryamp, wetamp);
                        }
                        else
                        {
                            printLog("Wet amplification + Dry amplification limit exceeded (limits: 0-1)\n");
                        }
                    }
                    else
                    {
                        printLog("Invalid Wet amplification (limits: 0-1)\n");
                    }
                }
                else
                {
                    printLog("Invalid Dry amplification (limits: 0-1)\n");
                }
            }
            else
            {
                printLog("Invalid Delay (limits: 0-48000)\n");
            }
        }

        /**
            * Terminate the current serial connection. 
        */
        private void btnDisconnect_Click(object sender, EventArgs e)
        {
            if (serialPort.IsOpen)
            {
                // Terminate the current serial connection
                serialPort.Close();

                // Update the GUI functionality
                updateApp();

                printLog(cmbCOMports.Text + " disconnected\n");
            }
            else
            {
                printLog("no com port connected\n");
            }
        }

        /**
            * Calculate and send new filter taps. 
        */
        private void btnFilterCalc_Click(object sender, EventArgs e)
        {
            iirFunction();
        }
        
       /// <summary>
       /// HELPER FUNCTIONS
       /// </summary>
        private string rxString;

        /**
            * Handle received serial data. 
        */
        private void serialPort_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            // Read the existing serial data
            rxString = serialPort.ReadExisting();

            // Create a new thread for handling the received data
            this.Invoke(new EventHandler(rxMethod));
        }

        /**
            * Prints the received data. 
        */
        private void rxMethod(object o, EventArgs e)
        {
            printLog("Data received: " + rxString + "\n");

            // Update the GUI functionality
            updateApp();
        }

        /**
            * Prints data in the GUI Log.
            * @param  [in]   s   string to be printed
            * @param  [in]   time   true if the log message should have a time stamp      
        */
        public void printLog(string s, bool time=true)
        {
            if(time)
                txtLog.AppendText("[" + DateTime.Now.ToString("HH:mm:ss tt") + "] " + s);
            else
                txtLog.AppendText(s);

            // Update the GUI functionality
            updateApp();
        }

        /**
            * Update the GUI 
        */
        private void updateApp()
        {
            // Fade connect button once connected to a serial port
            btnConnect.Enabled = !serialPort.IsOpen;

            // Fade send if not connected to a serial port
            btnSend.Enabled = serialPort.IsOpen;

            // Fade disconnect if not connected to a serial port
            btnDisconnect.Enabled = serialPort.IsOpen;
            
            txtLog.SelectionStart = txtLog.Text.Length;
            txtLog.ScrollToCaret();
            
            if (serialPort.IsOpen)
            {
                // Change the following interface behavious if the device is connected
                statusStripConnect.Text = "Connected";
                statusStripConnect.ForeColor = Color.Green;
                btnChangeFilterAmp.Enabled = true;
                btnFilterCalc.Enabled = true;
                btnEcho.Enabled = true;
                cmbCOMports.Enabled = false;
                cmbBaudRate.Enabled = false;
                statusStripBaud.Text = "Baud rate: " + serialPort.BaudRate;
            }else{

                // Change the following interface behavious if the device is not connected
                statusStripConnect.Text = "Not Connected";
                statusStripConnect.ForeColor = Color.Red;
                btnChangeFilterAmp.Enabled = false;
                btnFilterCalc.Enabled = false;
                btnEcho.Enabled = false;
                cmbCOMports.Enabled = true;
                cmbBaudRate.Enabled = true;
                statusStripBaud.Text = "Baud rate: --";
            }
        }

        /**
            * Calculate and send new filter taps. 
        */
        private void iirFunction()
        {
            float filterOrder; 
            float filterBassFreq;
            float filterTrebleFreq;
            float filterSamplingFreq;
            
            // Make sure that all text fields contains valid information
            if (float.TryParse(txtOrder.Text, out filterOrder) && 
                Convert.ToInt16(txtOrder.Text) > 0 && 
                Convert.ToInt16(txtOrder.Text) < MAX_FILTER_ORDER)
            {
                if (float.TryParse(txtBassFreq.Text, out filterBassFreq) && 
                    Convert.ToInt16(txtBassFreq.Text) > 0 && 
                    Convert.ToInt16(txtBassFreq.Text) < MAX_BASS_FREQ)
                {
                    if (float.TryParse(txtTrebleFreq.Text, out filterTrebleFreq) && 
                        Convert.ToInt16(txtTrebleFreq.Text) > 0 && 
                        Convert.ToInt16(txtTrebleFreq.Text) < MAX_TREBLE_FREQ)
                    {
                        if (float.TryParse(txtSamplingFreq.Text, out filterSamplingFreq) && 
                            Convert.ToInt32(txtSamplingFreq.Text) > 0 && 
                            Convert.ToInt32(txtSamplingFreq.Text) < MAX_SAMPLING_FREQ)
                        {
                            object xlp, xbp, xhp, ylp, ybp, yhp;
                            
                            // Clear matlab from previous commands
                            matlab.Execute("clear;");
                           
                            // Calculate the filter coefficents for the tone filters using the matlab COM object
                            matlab.Execute("[xlp, ylp] = butter(" + filterOrder.ToString() + "," +
                                (2*filterBassFreq / 1000).ToString() + "/" + (filterSamplingFreq / 1000).ToString() + "," +
                                "'low'" + ");");

                            matlab.Execute("[xbp, ybp] = butter(" + (filterOrder-1).ToString() + "," + "[(" +
                               (2 * filterBassFreq / 1000).ToString() + "/" + (filterSamplingFreq / 1000).ToString() + ") (" +
                               (2 * filterTrebleFreq / 1000).ToString() + "/" + (filterSamplingFreq / 1000).ToString() + ")]);");

                            matlab.Execute("[xhp, yhp] = butter(" + filterOrder.ToString() + "," +
                                (2 * filterTrebleFreq / 1000).ToString() + "/" + (filterSamplingFreq / 1000).ToString() + "," +
                                "'high'" + ");");

                            // Get the filter taps
                            xlp = matlab.GetVariable("xlp", "base");
                            ylp = matlab.GetVariable("ylp", "base");
                            xbp = matlab.GetVariable("xbp", "base");
                            ybp = matlab.GetVariable("ybp", "base");
                            xhp = matlab.GetVariable("xhp", "base");
                            yhp = matlab.GetVariable("yhp", "base");
                            
                            // Convert the filter taps to the correct format
                            var lpFilterCoeffX = (double[,])xlp;
                            var lpFilterCoeffY = (double[,])ylp;
                            var midFilterCoeffX = (double[,])xbp;
                            var midFilterCoeffY = (double[,])ybp;
                            var hpFilterCoeffX = (double[,])xhp;
                            var hpFilterCoeffY = (double[,])yhp;

                            // If extensive logging is seclected print the filter coefficients
                            if (chkExtLog.Checked)
                            {
                                printFilterCoeff("LP X", filterBassFreq, lpFilterCoeffX);
                                printFilterCoeff("LP Y", filterBassFreq, lpFilterCoeffY);
                                printFilterCoeff("MID X", 0, midFilterCoeffX);
                                printFilterCoeff("MID Y", 0, midFilterCoeffY);
                                printFilterCoeff("HP X", filterTrebleFreq, hpFilterCoeffX);
                                printFilterCoeff("HP Y", filterTrebleFreq, hpFilterCoeffY);
                            }

                            // Format and Send the BASS filter taps if the bass checkbox is checked
                            if (chkBass.Checked)
                            {
                                send_filter_coeff(Filter_type.BASS, lpFilterCoeffX, lpFilterCoeffY);
                            }

                            // Format and Send the MID filter taps if the mid checkbox is checked
                            if (chkMiddle.Checked)
                            {
                                send_filter_coeff(Filter_type.MIDDLE, midFilterCoeffX, midFilterCoeffY);
                            }

                            // Format and Send the TREBLE filter taps if the treble checkbox is checked
                            if (chkTreble.Checked)
                            {
                                send_filter_coeff(Filter_type.TREBLE, hpFilterCoeffX, hpFilterCoeffY);
                            }


                        }else{
                            printLog("Invalid Sampling frequency (limits: 0-50000)\n");
                        }
                    }else{
                        printLog("Invalid filter Treble frequency (limits: 0-30000)\n");
                    }
                }else{
                    printLog("Invalid filter Bass frequency (limits: 0-10000)\n");
                }    
            }else{
                printLog("Invalid filter order (limits: 0-100)\n");
            }
        }

        /**
            * Change the tone-control filter amplification. 
        */
        private void btnChangeFilterAmp_Click(object sender, EventArgs e)
        {
            if (serialPort.IsOpen)
            {
                if (chkBass.Checked)
                {
                    // send a message containing the new amplification value
                    sent_amp(Filter_type.BASS, txtAmpBass.Text);
                }
                if (chkMiddle.Checked)
                {
                    // send a message containing the new amplification value
                    sent_amp(Filter_type.MIDDLE, txtAmpMiddle.Text);
                }
                if (chkTreble.Checked)
                {
                    // send a message containing the new amplification value
                    sent_amp(Filter_type.TREBLE, txtAmpTreble.Text);
                }
            }
            else
            {
                printLog("No serial connection established\n");
            }
        }

        /**
            * Prints data in the GUI Log.
            * @param  [in]   ft             the filter type to change the coefficients for
            * @param  [in]   filterCoeffX   double array containing the filter IIR X filter coefficients      
            * @param  [in]   filterCoeffY   double array containing the filter IIR Y filter coefficients      
        */
        private void send_filter_coeff(Filter_type ft, Double[,] filterCoeffX, Double[,] filterCoeffY)
        {
            // Create a new filter object
            Filter filter = new Filter(ft, (Int16)filterCoeffX.Length);
            
            // Add the filter coefficents to the filter
            filter.addFilterTap(filterCoeffX, filterCoeffY);
            
            if(chkExtLog.Checked)
                filter.printData();
            
            // Get a char array with filter data using the the modified SREC protocol
            char[] tx_data = filter.sendFilterFreqData();
            
            if (serialPort.IsOpen)
            {
                printLog("Sending UART data: " + new string(tx_data) + "\n");
               
                // Write the data to the COM port
                serialPort.Write(new string(tx_data));
            }
            else
            {
                printLog("No serial connection established\n");
            }
        }


        /**
            * Print the filter coefficients for a filter.
            * @param  [in]   filtername     The name of the filter (filter type)
            * @param  [in]   filterFreq     The filter frequency   
            * @param  [in]   filterCoeff    The filter coefficients     
        */
        private void printFilterCoeff(string filtername, float filterFreq, double[,] filterCoeff)
        {
            printLog(filtername + " filter @" + (filterFreq / 1000).ToString() + "kHz\t num taps: " + filterCoeff.Length + "\n");
            
            // Print all the taps in the filter
            foreach (double tap in filterCoeff)
            {
                // Format and print a tap
                printLog(frac2int((float)tap).ToString() + "\t" + tap.ToString()+ ", \n", false);
            }
            printLog("\n", false);
        }

        /**
            * Helper function that prints an Int16 as a binary string.
            * @param  [in]  val     Value to be printed  
        */
        void printBinary_16(Int16 val)
        {
            int i;
            Console.Write("Input value: %d\t Binary value: ", val);
            for (i = (sizeof(Int16) * 8) - 1; i >= 0; i--)
            {
                if ((val & (1 << i)) > 0)
                {
                    Console.Write("1");
                }
                else
                {
                    Console.Write("0");
                }
            }
            Console.Write("\n");
        }

        /**
            * Converts a float value to a Q2.14 integer representation.
            * @param  [in]  f     Value to be converted 
            * @return an integer representation of the float value
        */
        public static Int16 frac2int(float f)
        {
            Int16 result = 0;
            
            // Do the convertion on positive values
            float t_f = Math.Abs(f);
            int i;

            for (i = (sizeof(Int16) * 8) - 1; i >= 0; i--)
            {
                // Convert the positive float value to an integer
                if (t_f >= Math.Pow(2.0, -(15 - i)))
                {
                    result |= (Int16)(1 << i - 1);
                    t_f -= (float)Math.Pow(2.0, -(15 - i));
                }
            }

            // if the input value is negative, invert the value.
            if (f < 0)
            {
                result = (Int16)~result;
            }

            return result;
        }

        /**
             * Converts a float value to a Q2.14 integer representation.
             * (This function is not working as it should)  
             * @param  [in]  delay      The echo delay  
             * @param  [in]  dryAmp     Amplification of the dry sound 
             * @param  [in]  wetAmp     Amplification of the wet sound 
        */
        private void send_echo(UInt16 delay, float dryAmp, float wetAmp)
        {
            char[] tx_data = new char[21];
            int _data_length = 12;
            
            // byte length of the message
            int byte_count = _data_length + 5;

            // Convert the delay, and amplification values to the correct representation
            char[] char_repr_delay = int2chararr((Int16)delay);
            char[] char_repr_dry = int2chararr(frac2int(dryAmp));
            char[] char_repr_wet = int2chararr(frac2int(wetAmp));

            //for (int i = 0; i < 4; i++)
            //{
            //    Console.WriteLine(char_repr_delay[i]);
            //}


            // Format the message to be sent
            tx_data[0] = 'S';
            tx_data[1] = '8';

            // Byte count field
            tx_data[2] = inttochar(((Int16)byte_count >> 4) & 0x000F);
            tx_data[3] = inttochar((Int16)byte_count & 0x000F);
            
            // Address field
            tx_data[4] = '0'; //address
            tx_data[5] = '0'; //address

            // Data field
            tx_data[6] = char_repr_delay[0];
            tx_data[7] = char_repr_delay[1];
            tx_data[8] = char_repr_delay[2];
            tx_data[9] = char_repr_delay[3];
            tx_data[10] = char_repr_dry[0];
            tx_data[11] = char_repr_dry[1];
            tx_data[12] = char_repr_dry[2];
            tx_data[13] = char_repr_dry[3];
            tx_data[14] = char_repr_wet[0];
            tx_data[15] = char_repr_wet[1];
            tx_data[16] = char_repr_wet[2];
            tx_data[17] = char_repr_wet[3];

            int check_sum = 0;
            check_sum += byte_count; // byte count
            check_sum += 0; // address
            for (int i = 6; i < _data_length+6; i += 2)
            {
                check_sum += tx_data[i] * 16 + tx_data[i + 1];
            }

            // Checksum field
            tx_data[18] = inttochar(((byte)~check_sum >> 4) & 0x000F);
            tx_data[19] = inttochar((byte)~check_sum & 0x000F);

            // End of message
            tx_data[20] = 'x'; // eos

            if (serialPort.IsOpen)
            {
                printLog("Sending UART data: " + new string(tx_data) + "\n");
                serialPort.Write(new string(tx_data));

            }else{
                printLog("No serial connection established\n");
            } 
        }

        /**
             * Converts an integer value to a char array of size 4
             * The char array format is expected by the modified SREC protocol
             * @param  [in]  num      integer value to be converted
             * @return char array of size four containing the integer value in char representation
        */
        private char[] int2chararr(Int16 num)
        {
            char[] ret_arr = new char[4];
            ret_arr[0] = Convert.ToChar((int)((num >> 12) & 0x000F));
            ret_arr[1] = Convert.ToChar(((num & 0x0FFF) >> 8) & 0x000F);
            ret_arr[2] = Convert.ToChar(((num & 0x00F0) >> 4) & 0x000F);
            ret_arr[3] = Convert.ToChar((num & 0x000F) & 0x000F);
            Console.WriteLine("x1: " + ((num >> 12) & 0x000F)+0x30);
            Console.WriteLine("x2: " + (((num & 0x0FFF) >> 8) & 0x000F) + 0x30);
            Console.WriteLine("x3: " + (((num & 0x00F0) >> 4) & 0x000F) + 0x30);
            Console.WriteLine("x4: " + ((num & 0x000F) & 0x000F) + 0x30);
            return ret_arr;
        }


        /**
             * Formats a filter amplification message
             * @param  [in]  amplification      string containing the amplification
             * @param  [in]  ft                 the filter type
             * @return a formatted filter amplification value
        */
        private char[] calc_amp_array(String amplification, Filter_type ft){
            Int16 _data_length = 4;
            Char[] _data = amplification.ToCharArray();


            Char[] _tx_data = new Char[_data_length + 9]; // header = 2, bit count = 2, address = 2, data = x, checksum = 2, eos = 1
            int check_sum = 0;
            int byte_count = _data_length + 5;
            check_sum += byte_count; // byte count
            check_sum += 0; // address
            
            
            for (int i = 0; i < _data_length; i += 2)
            {
                // Print the checksum values if extensive logging is checked
                if (chkExtLog.Checked)
                {
                    Console.WriteLine("data i: " + _data[i].ToString());
                    Console.WriteLine("data i+1: " + _data[i + 1].ToString());
                }

                // Calculate the message check sum
                check_sum += (_data[i]-'0') * 16 + (_data[i + 1]-'0');
            }

            // Format the message to be sent
            _tx_data[0] = 'S';
            switch (ft)
            {
                case Filter_type.BASS:
                    _tx_data[1] = '3';
                    break;
                case Filter_type.MIDDLE:
                    _tx_data[1] = '4';
                    break;
                case Filter_type.TREBLE:
                    _tx_data[1] = '5';
                    break;
            }

            // Byte count field
            _tx_data[2] = inttochar(((Int16)byte_count >> 4) & 0x000F);
            _tx_data[3] = inttochar((Int16)byte_count & 0x000F);

            // Address field
            _tx_data[4] = '0';
            _tx_data[5] = '0';

            // Data field
            for (int i = 0; i < _data_length; i++)
            {
                _tx_data[6 + i] = _data[i];
            }

            Console.WriteLine("chk sum: " + check_sum.ToString());

            // Checksum field
            _tx_data[_data_length + 6] = inttochar(((byte)~check_sum >> 4) & 0x000F);
            _tx_data[_data_length + 7] = inttochar((byte)~check_sum & 0x000F);
            
            // End of message
            _tx_data[_data_length + 8] = 'x';

            return _tx_data;

        }

        /**
             * Convert an integer ( < 16) to the hex char
             * @param  [in]  amplification      string containing the amplification
             * @return hexadecimal value as a character
        */
        static public char inttochar(int num)
        {
            return "0123456789ABCDEF"[num];
        }

        /**
             * Sends new filter amplification values for a specific filter
             * @param  [in]  ft      the filter type
             * @param  [in]  s       string containing the filter amplification
        */
        private void sent_amp(Filter_type ft, String s)
        {
            Char[] tx_data = calc_amp_array(s, ft);
            printLog("Sending UART data: " + new string(tx_data) + "\n");
            serialPort.Write(new string(tx_data));
        }
    }
    


}

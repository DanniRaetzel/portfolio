## clock
create_clock -period 10.000 -name sysClk -waveform {0.000 5.000} [get_ports {clock}]

## 7 segment
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[0] }]; #Assign G 
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[1] }]; #Assign F
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[2] }]; #Assign E 
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[3] }]; #Assign D 
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[4] }]; #Assign C 
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[5] }]; #Assign B 
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[6] }]; #Assign A 
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { seven_seg[7] }]; #Assign dp 

## 7 segments drivers
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { disp_cc[0] }]; # driver 0
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { disp_cc[1] }]; # driver 1
set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { disp_cc[2] }]; # driver 2
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { disp_cc[3] }]; # driver 3

## LEDs
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { ready_LED }]; # 
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { busy_LED }]; #
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { channel_LED[0] }]; #
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { channel_LED[1] }]; #

## R2R LADDER
set_property -dict { PACKAGE_PIN F3   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[0] }]; # 
set_property -dict { PACKAGE_PIN F4   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[1] }]; #
set_property -dict { PACKAGE_PIN D3   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[2] }]; # 
set_property -dict { PACKAGE_PIN D4   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[3] }]; # 
set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[4] }]; # 
set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[5] }]; # 
set_property -dict { PACKAGE_PIN D2   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[6] }]; # 
set_property -dict { PACKAGE_PIN E2   IOSTANDARD LVCMOS33 } [get_ports { r2r_ctrl[7] }]; #

## R2R Comparator output
set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { adc_channel[0] }]; # 
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { adc_channel[1] }]; #

## buttons
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { conv_start }];     #btn0 
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { toggle_ch }]; #btn1
set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { rst }];     #btn3 reset

## clock
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clock }]; #100 MHZ clock

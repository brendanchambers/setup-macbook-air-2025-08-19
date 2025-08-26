# print info about hardware / available local compute



system_profiler SPDisplaysDataType
    # Graphics/Displays:

    #     Apple M4:

    #       Chipset Model: Apple M4
    #       Type: GPU
    #       Bus: Built-In
    #       Total Number of Cores: 10
    #       Vendor: Apple (0x106b)
    #       Metal Support: Metal 3
    #       Displays:
    #         Color LCD:
    #           Display Type: Built-in Liquid Retina Display
    #           Resolution: 2880 x 1864 Retina
    #           Main Display: Yes
    #           Mirror: Off
    #           Online: Yes
    #           Automatically Adjust Brightness: Yes
    #           Connection Type: Internal
# or e.g. 
# system_profiler SPDisplaysDataType | grep "Chipset Model"



sudo powermetrics --samplers gpu_power -n1  # you can specify sampling interval and number of ticks here
    # Machine model: Mac16,13
    # OS version: 24F74
    # Boot arguments:
    # Boot time: Wed Aug 13 23:32:02 2025



    # *** Sampled system activity (Mon Aug 25 14:25:51 2025 -0400) (5002.44ms elapsed) ***


    # **** GPU usage ****

    # GPU HW active frequency: 338 MHz
    # GPU HW active residency:   1.14% (338 MHz: 1.1% 618 MHz:   0% 796 MHz:   0% 836 MHz:   0% 928 MHz:   0% 952 MHz:   0% 1056 MHz:   0% 1053 MHz:   0% 1170 MHz:   0% 1152 MHz:   0% 1278 MHz:   0% 1204 MHz:   0% 1338 MHz:   0% 1326 MHz:   0% 1470 MHz:   0%)
    # GPU SW requested state: (P1 :  97% P2 : 2.9% P3 :   0% P4 :   0% P5 :   0% P6 :   0% P7 :   0% P8 :   0% P9 :   0% P10 :   0% P11 :   0% P12 :   0% P13 :   0% P14 :   0% P15 :   0%)
    # GPU SW state: (SW_P1 : 1.1% SW_P2 :   0% SW_P3 :   0% SW_P4 :   0% SW_P5 :   0% SW_P6 :   0% SW_P7 :   0% SW_P8 :   0% SW_P9 :   0% SW_P10 :   0% SW_P11 :   0% SW_P12 :   0% SW_P13 :   0% SW_P14 :   0% SW_P15 :   0%)
    # GPU idle residency:  98.86%
    # GPU Power: 6 mW



```
位运算

binary num1 2    :                                  10 
binary num2 99999:                 1 10000110 10011111 
binary num3 -5   : 11111111 11111111 11111111 11111011 

num1 << 8
before: binary num1:                                  10 
after : binary num1:                         10 00000000 

num2 >> 8
before: binary num2:                 1 10000110 10011111 
after : binary num2:                          1 10000110 

num3 >>> 3
before: binary num3: 11111111 11111111 11111111 11111011 
after : binary num3:    11111 11111111 11111111 11111111 

num1 | num2
before: binary num1:                                  10 
before: binary num2:                 1 10000110 10011111 
after : binary res :                 1 10000110 10011111 

num1 & num2
before: binary num1:                                  10 
before: binary num2:                 1 10000110 10011111 
after : binary res :                                  10 

num1 ^ num2
before: binary num1:                                  10 
before: binary num2:                 1 10000110 10011111 
after : binary res :                 1 10000110 10011101 

~ num2
before: binary num2:                 1 10000110 10011111 
after : binary res : 11111111 11111110 01111001 01100000 




binary num1 2        :                                  10 
binary num2 99999    :                 1 10000110 10011111 
99999 << 8           :        1 10000110 10011111 00000000 
99999 << 8 | 2       :        1 10000110 10011111 00000010 
get num2 out         :                 1 10000110 10011111 
get num1 out         :                                  10 


```


```java
 @Test
    public void calculation(){
        int num1 = 2;
        int num2 = 99999;
        int num3 = -5;

        String formatted = "";
        String tempStr = "";
        int tempRes = 0;

        tempStr = Integer.toBinaryString(num1);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("binary num1 2    : "+formatted );

        tempStr = Integer.toBinaryString(num2);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("binary num2 99999: "+formatted );

        tempStr = Integer.toBinaryString(num3);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("binary num3 -5   : "+formatted );



        tempRes = num1 << 8;
        System.out.println("\nnum1 << 8");

        tempStr = Integer.toBinaryString(num1);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num1: "+formatted);

        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary num1: "+formatted);



        tempRes = num2 >> 8;
        System.out.println("\nnum2 >> 8");

        tempStr = Integer.toBinaryString(num2);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num2: "+formatted);

        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary num2: "+formatted);

        /*
        无符号的意思是将符号位当作数字位看待。
        即无论值的正负，都在高位补0.
        * */
        tempRes = num3 >>> 3;
        System.out.println("\nnum3 >>> 3");

        tempStr = Integer.toBinaryString(num3);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num3: "+formatted);

        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary num3: "+formatted);



        tempRes = num1 | num2;
        System.out.println("\nnum1 | num2");

        tempStr = Integer.toBinaryString(num1);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num1: "+formatted);

        tempStr = Integer.toBinaryString(num2);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num2: "+formatted);

        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary res : "+formatted);



        tempRes = num1 & num2;
        System.out.println("\nnum1 & num2");

        tempStr = Integer.toBinaryString(num1);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num1: "+formatted);

        tempStr = Integer.toBinaryString(num2);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num2: "+formatted);

        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary res : "+formatted);



        tempRes = num1 ^ num2;
        System.out.println("\nnum1 ^ num2");

        tempStr = Integer.toBinaryString(num1);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num1: "+formatted);

        tempStr = Integer.toBinaryString(num2);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num2: "+formatted);

        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary res : "+formatted);


        tempRes = ~ num2;
        System.out.println("\n~ num2");

        tempStr = Integer.toBinaryString(num2);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("before: binary num2: "+formatted);


        tempStr = Integer.toBinaryString(tempRes);
        formatted = String.format("%32s", tempStr).replaceAll("(.{8})", "$1 ");
        System.out.println("after : binary res : "+formatted);
    }

```

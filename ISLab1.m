A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

hsv_value_A1=spalva_color(A1);
metric_A1=apvalumas_roundness(A1);
hsv_value_A2=spalva_color(A2);
metric_A2=apvalumas_roundness(A2);
hsv_value_A3=spalva_color(A3);
metric_A3=apvalumas_roundness(A3);
hsv_value_A4=spalva_color(A4);
metric_A4=apvalumas_roundness(A4);
hsv_value_A5=spalva_color(A5);
metric_A5=apvalumas_roundness(A5);
hsv_value_A6=spalva_color(A6);
metric_A6=apvalumas_roundness(A6);
hsv_value_A7=spalva_color(A7);
metric_A7=apvalumas_roundness(A7);
hsv_value_A8=spalva_color(A8);
metric_A8=apvalumas_roundness(A8);
hsv_value_A9=spalva_color(A9);
metric_A9=apvalumas_roundness(A9);

hsv_value_P1=spalva_color(P1);
metric_P1=apvalumas_roundness(P1);
hsv_value_P2=spalva_color(P2);
metric_P2=apvalumas_roundness(P2);
hsv_value_P3=spalva_color(P3);
metric_P3=apvalumas_roundness(P3);
hsv_value_P4=spalva_color(P4);
metric_P4=apvalumas_roundness(P4);

x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
P=[x1;x2];

T=[1;1;1;-1;-1];

w1 = randn(1);
w2 = randn(1);
b = randn(1);

v = 0;
er = 0;

for n = [1 2 3 4 5]%n=1:5
    
    v(n) = P(1,n) * w1 + P(2,n) * w2 + b;
    
    if v(n) > 0
        y = 1;
    else
        y = -1;
    end
    
    er(n) = T(n) - y;
    
end

e = abs(er(1)) + abs(er(2)) + abs(er(3)) + abs(er(4)) + abs(er(5));

eta = 0.1;

while e ~= 0
    
    for n = [1 2 3 4 5]
    
        v(n) = P(1,n) * w1 + P(2,n) * w2 + b;
        
        if v(n) > 0
            y = 1;
        else
            y = -1;
        end
        
        er(n) = T(n) - y;
        w1 = w1 + eta * er(n) * P(1,n);
        w2 = w2 + eta * er(n) * P(2,n);
        b = b + eta * er(n);
    
    end
    
    for n = [1 2 3 4 5]
    
        v(n) = P(1,n) * w1 + P(2,n) * w2 + b;
        
        if v(n) > 0
            y = 1;
        else
            y = -1;
        end
        
        er(n) = T(n) - y;
    end
    
    e = abs(er(1)) + abs(er(2)) + abs(er(3)) + abs(er(4)) + abs(er(5));
    disp(e); % po kiekvieno atnaujinimo isvedame absoliutine paklaida i konsole
    
end

x1=[hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_A7 hsv_value_A8 hsv_value_A9 hsv_value_P3 hsv_value_P4];
x2=[metric_A4 metric_A5 metric_A6 metric_A7 metric_A8 metric_A9 metric_P3 metric_P4];
P=[x1;x2];

T=[1;1;1;1;1;1;-1;-1];

v = 0;
er = 0;

for n = [1 2 3 4 5 6 7 8]
    
    v(n) = P(1,n) * w1 + P(2,n) * w2 + b;
    
    if v(n) > 0
        y = 1;
    else
        y = -1;
    end
    
    er(n) = T(n) - y;
    
end

e = abs(er(1)) + abs(er(2)) + abs(er(3)) + abs(er(4)) + abs(er(5)) + abs(er(6)) + abs(er(7)) + abs(er(8));
disp(e); % isvedame absoliucia paklaida patikrinus su likusiais vaisiu atvaizdais

x = linspace(-10,10,100);
y = x * w1 + x * w2 + b;
plot(x,y);
grid on;
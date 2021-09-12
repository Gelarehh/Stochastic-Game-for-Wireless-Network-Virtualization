clc
clear all
close all
frm_size=20*10^(-3);
avg_snr=20;
h=exprnd(1);
%arrival process is poisson, packet length is fixed and there are 3
%channels. So packets experience M/G/3 queue.
arv_rate1=2;
arv_rate2=2;
arv_rate3=3;
arv_rate4=3;
b1=7.3350;%denotes boundareis for adaptive modulation
b2=10.7856;
b3=14.4654;
b4=17.7753;
b5=20.9280;
b6=24.0078;
b7=27.0525;
snr=avg_snr;
if snr<b1 %implementing the adaptive modulation constraints
    tx_rate=0;
elseif snr<b2
    tx_rate=1;
elseif snr<b3
    tx_rate=2;
elseif snr<b4
    tx_rate=3;
elseif snr<b5
    tx_rate=4;
elseif snr<b6
    tx_rate=5;
elseif snr<b7
    tx_rate=6;
else 
    tx_rate=7;
end
q1=2*arv_rate1/(tx_rate*(2*arv_rate1+5*10^(-3)-tx_rate));%qk represents queue length for user k 
q2=2*arv_rate2/(tx_rate*(2*arv_rate2+5*10^(-3)-tx_rate));
q3=2*arv_rate3/(tx_rate*(2*arv_rate3+5*10^(-3)-tx_rate));
q4=2*arv_rate4/(tx_rate*(2*arv_rate4+5*10^(-3)-tx_rate));
U1=-2*q1; %Uk denotes immediate utility of user k
U2=-3*q2;
U3=-2.5*q3;
U4=-4*q4;
SP_1=0.5*(U1+U2);
SP_2=0.5*(U3+U4);
conj_prc=6;% A fixed conjectural price is assumed to be used.
A=10; %A large enough multiplier
for B=0.1:0.1:0.9 %changing the discount factor
    r=conj_prc^2-10*conj_prc+25;
    syms t
    sum=symsum((B^(t-1))*r,1,inf);
    syms T
    sum1=symsum(B^(T-5)*r,10,inf);
    R=(1-B)*(10-conj_prc)*sum1;
    add_pay=A*((1-B)*(10-conj_prc)*sum-R);
    utility=U1-add_pay;
    plot(B,utility,'rs','LineWidth',5,'MarkerSize',2)
    hold on
end
xlabel('Discount factor')
ylabel('Utility of user 1')
title('Manipulating the discount factor of User 1')
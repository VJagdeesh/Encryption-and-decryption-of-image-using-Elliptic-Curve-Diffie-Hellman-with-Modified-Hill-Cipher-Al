clc
clear
q = 100049;	% large prime number
n=1;
a = 1;
b = 3;
result=myprime(q);
%disp("Checking number "+(result));
if (4*(a^3))+ (27*(b^2)) ~= 0
if(result==1)
    Eq_a_b = generate_elliptic_curve(a,b,q,0,10000);
    G_x = Eq_a_b(n,1);
    G_y = Eq_a_b(n,2);  
% alice
    private_alice = 41;     % alice's private key
    p_alice_x = G_x;   % alice's public key= 289*G
    p_alice_y = G_y;
      
% multiply private_alice times
    for i = 2:private_alice
        P1 = elliptic_curve_add(G_x,G_y,p_alice_x,p_alice_y,a,b,q);
        p_alice_x = P1(1);
        p_alice_y = P1(2);
    end
end
end
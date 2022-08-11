    p_bob_x=27821;
    p_bob_y=32673;
    %p_bob_x=136;
    %p_bob_y=136;
    k1_x1 = p_bob_x;
    k1_y1 = p_bob_y;
    for i = 2:private_alice
        SK = elliptic_curve_add(p_bob_x,p_bob_y,k1_x1,k1_y1,a,b,q);
        k1_x1 = SK(1);
        k1_y1 = SK(2);
    end
% key exchange

% Xg*G
% K1
    k1_x = G_x;
    k1_y = G_y;
    %for i = 2:mod(k1_x1,100000)
    for i = 2:k1_x1
        Key1 = elliptic_curve_add(G_x,G_y,k1_x,k1_y,a,b,q);
        k1_x = Key1(1);
        k1_y = Key1(2);   
    end
% Yg*G
% K2
    k2_x = G_x;
    k2_y = G_y;
    %for i = 2:mod(k1_y1,100000)
    for i = 2:k1_y1
        Key2 = elliptic_curve_add(G_x,G_y,k2_x,k2_y,a,b,q);
        k2_x = Key2(1);
        k2_y = Key2(2);
    end

    %fprintf('a=%s, b=%s, q=%s, n=%s, private_alice=%s, private_bob=%s\n',num2str(a),num2str(b),num2str(q),num2str(n),num2str(private_alice),num2str(private_bob));
    fprintf('base point G of elliptic curve : (%s,%s)\n',num2str(G_x),num2str(G_y));
    fprintf('Public key of Alice: (%s,%s)\n',num2str(p_alice_x),num2str(p_alice_y));
    fprintf('Public key of Bob: (%s,%s)\n',num2str(p_bob_x),num2str(p_bob_y));
    fprintf('shared common key of Alice & Bob : (%s,%s)\n',num2str(k1_x1),num2str(k1_y1));
    fprintf('Key 1: (%s,%s)\n',num2str(k1_x),num2str(k1_y));
    Xg=k1_x;
    Yg=k1_y;
    X2g=k2_x;
    Y2g=k2_y;
    fprintf('Key 2: (%s,%s)\n',num2str(k2_x),num2str(k2_y));
    M11=Xg;
    M12=Yg;
    M21=X2g;
    M22=Y2g;
    Kcm=mod([M11 M12 M21 M22;M22 M11 M12 M21;M21 M22 M11 M12;M12 M21 M22 M11],256);
    I=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1]
    SELF_INVERTIBLE_KEY=mod([Kcm I-Kcm;I+Kcm -Kcm],256);
    disp("The self-invertible key matrix is :");
    disp(SELF_INVERTIBLE_KEY);
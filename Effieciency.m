decryptedimg=imread(('DecryptedImage (2).tiff'));
figure,imhist(decryptedimg)
J1=entropy(encryptedimg);
J2=entropy(img);
J3=entropy(decryptedimg);
stt=0;
for c = 1:lt
    for r = 1:bt
        stt=double(((img(c,r)-encryptedimg(c,r)).^2))+stt;
    end
end
mse=stt/(256*256);
%b=(log10(255)-log10(mse))
p=20*(log10(255/mse));

stt1=0;
for c = 1:lt
    for r = 1:bt
        stt1=double(((img(c,r)-decryptedimg(c,r)).^2))+stt1;
    end
end
mse1=stt1/(256*256);
%b=(log10(255)-log10(mse))
p2=20*(log10(255/mse1));

dtt=0;
for i = 1:lt
    for j = 1:bt
        dtt=(abs(double(img(i,j))-double(encryptedimg(i,j)))/255)+dtt;
    end
end
uaci=dtt/(lt*bt);

disp("Encrypted Entropy :"+J1);
disp("Entropy Original :"+J2);
disp("Decrypted Entropy :"+J3);
disp("PSNR of original and encrypted :"+p);
disp("PSNR of Original and Decrypted  :"+p2);
disp("UACI :"+(uaci*100));
x=double(img);
y=double(encryptedimg);
R=corr2(x,y);
disp("CC is :"+R);


   
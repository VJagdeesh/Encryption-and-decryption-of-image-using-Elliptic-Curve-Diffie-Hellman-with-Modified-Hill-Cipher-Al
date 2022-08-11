input=imread(('LenaEnc.tiff'))
%input=imresize(input,[256,256])
[lt bt]=size(input)
figure,imshow(input);
i=1
    while(i<=lt)
        j=1
        while(j<=lt)
            p1=double([input(i,j);input(i,j+1);input(i,j+2);input(i,j+3);input(i,j+4);input(i,j+5);input(i,j+6);input(i,j+7)]);
            t=mod(SELF_INVERTIBLE_KEY*p1,256);
            input(i,j)=t(1);
            input(i,j+1)=t(2);
            input(i,j+2)=t(3);
            input(i,j+3)=t(4);
            input(i,j+4)=t(5);
            input(i,j+5)=t(6);
            input(i,j+6)=t(7);
            input(i,j+7)=t(8);
            j=j+8
        end
        i=i+1
    end
    decryptedimg=input;
    %decryptedimg=imread(('DecryptedImage.tiff'));
    figure,imshow(input);
    title('Decrypted Image')
    imwrite(decryptedimg,'decrypted.tiff');
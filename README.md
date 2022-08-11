# Encryption-and-decryption-of-image-using-Elliptic-Curve-Diffie-Hellman-with-Modified-Hill-Cipher-Al

Alice and Bob select their random private key a and b respectively.
Alice and Bob calculate respectively a*G and b*G, where G is generator point of Elliptic curve, and sends it to each other. 
Both of them compute the shared secret SK= a *(b * G) = b *(a*G) = abG. 

By getting secret key SK=a*b*G=(Xg,Yg)
K1=Xg*Generator point=(M11,M12)
K2=Yg*Generator point=(M21,M22)

Kcm=[M11 M12 M21 M22;M22 M11 M12 M21;M21 M22 M11 M12;M12 M21 M22 M11] MOD m  
Kcm is called circulant matrix. In this each row is rotated one element to the right relative to the preceding row.

Self Invertible matrix SKm=[Kcm I-Kcm;I+Kcm -Kcm] MOD m

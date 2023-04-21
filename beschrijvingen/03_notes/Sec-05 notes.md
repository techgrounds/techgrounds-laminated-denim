[Public key cryptography](https://www.ibm.com/docs/en/ztpf/2020?topic=concepts-public-key-cryptography)
[Hybrid Key Encryption](https://developers.google.com/tink/hybrid)
[RSA](https://www.javatpoint.com/rsa-encryption-algorithm)

Research hybrid encryption als tip van Casper

#### RSA
Named for its creators, Rivest, Shamir and Adelman. It is a form of public key encryption, also known as asymmetric encryption. It is widely used to secure data transmissions, digital signatures and key exchanges.

#### Public key cryptography
Also known as public key encryption and asymmetric encryption, public key cryptography is a form of encryption that involves a public and private key. The public key is broadcast over the internet; anyone can use it to encrypt a message that can then only be read by the owner of the private key. Conversely, the owner of the private key can also encrypt data with it that can then be read by anyone with the public key. While this does not secure the data, it does certify that the source of the data is the owner of the private key.

#### Hybrid Public Key Encryption
HPKE is a form of hybrid encryption, utilising both symmetric and asymmetric encryption. A symmetric key is generated used to encrypt a message. This symmetric key is then encrypted with a public key, and sent to the intended recipient that owns the private key. With their private key, the recipient can decode the symmetric key and following that, the message itself.
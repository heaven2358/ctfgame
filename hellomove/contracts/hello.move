module SimpleCTF {
    use 0x1::Signer;
    use 0x1::Vector;

    struct SecretFlag {
        value: vector<u8>,
    }

    struct PublicKey {
        value: vector<u8>,
    }

    public fun init(account: &signer, public_key: vector<u8>) {
        let secret_flag = SecretFlag { value: b"CTF{M0ve_L@nguage_Ch@llenge}" };
        move_to(account, secret_flag);
        let pubkey = PublicKey { value: public_key };
        move_to(account, pubkey);
    }

    public fun retrieve_flag(account: &signer, public_key: vector<u8>): vector<u8> {
        let pubkey = borrow_global<PublicKey>(Signer::address_of(account));
        if (Vector::eq(&public_key, &pubkey.value)) {
            let secret_flag = borrow_global<SecretFlag>(Signer::address_of(account));
            return Vector::copy(&secret_flag.value);
        } else {
            abort 42;
        }
    }
}

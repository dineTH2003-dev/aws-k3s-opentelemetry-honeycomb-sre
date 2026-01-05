# SSH Access Using PuTTY (Windows)

This part is critical and often missing in tutorials.

## 1. Convert PEM → PPK

**Tool:** PuTTYgen

**Steps:**

1. Open PuTTYgen
2. Load .pem file
3. Click "Save private key"
4. Save as .ppk

## 2. Configure PuTTY Session

- **Host Name:** ubuntu@<EC2_PUBLIC_IP>
- **Port:** 22
- **Connection → SSH → Auth → Browse → Select .ppk**
- **Save session**

## 3. Login

Click Open → SSH access to EC2


import qrcode

def generate_qrcode(text, filename):
    # Generate the QR code using the provided text
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(text)
    qr.make(fit=True)

    # Create an image from the QR code data
    qr_image = qr.make_image(fill_color="black", back_color="white")

    # Save the image with the provided filename
    qr_image.save(filename)

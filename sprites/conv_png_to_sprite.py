import argparse
from PIL import Image

def convert_to_8_bit_sprite(input_image_path, output_text_path):

    img = Image.open(input_image_path)

    img = img.convert('P', palette=Image.ADAPTIVE, colors=256)

    pixel_data = img.tobytes()

    width, height = img.size

    name = ""
    splitname = input_image_path.split('.')
    if len(splitname) > 1:
        name = splitname[0]
    else:
        name = splitname

    with open(output_text_path, 'w') as output_file:
        output_file.write(";w=" + str(width) + " ;h=" + str(height) + "\n" + name + ":\n")
        for y in range(height):
            row = []
            for x in range(width):
                pixel_value = pixel_data[y * width + x]
                row.append(hex(pixel_value))
            row_str = ', '.join(row)
            output_file.write("db " + row_str + '\n')
    


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Convert a PNG image to an 8-bit sprite text file.')
    parser.add_argument('input_image', help='Input PNG image filename')
    parser.add_argument('output_text', help='Output text file filename')
    args = parser.parse_args()

    input_image_path = args.input_image
    output_text_path = args.output_text

    convert_to_8_bit_sprite(input_image_path, output_text_path)
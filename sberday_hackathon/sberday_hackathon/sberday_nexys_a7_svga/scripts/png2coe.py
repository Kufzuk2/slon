from PIL import Image

image = Image.open('../figures/tile_mine_exp.png').convert('RGB')

with open('../figures/coe/tile.coe','w') as f:
    f.write('memory_initialization_radix=16;\n')
    f.write('memory_initialization_vector=\n')

    for i, pixel in enumerate(image.getdata()):
        r_4 = pixel[0] >> 4
        g_4 = pixel[1] >> 4
        b_4 = pixel[2] >> 4

        res = r_4 | g_4 << 4 | b_4 << 8
        f.write (f'rom[{i}] = 12\'h{res:03x};\n')
    
    f.write(';')
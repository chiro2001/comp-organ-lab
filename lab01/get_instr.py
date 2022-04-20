import os

with os.popen("riscv64-linux-gnu-objdump -d calc") as f:
  lines = f.readlines()
  lines = [line for line in lines if len(line) > 20 and line[8] == ':']
  lines = [line.split(':')[-1].strip() for line in lines]
  for line in lines:
    items = [item.strip() for item in line.split('\t')]
    data = {
      'inst': int(items[0], 16),
      'code': ' '.join(items[1:])
    }
    with os.popen(f"./nemu-lite/build/riscv64-decoder {data['inst']}") as r:
      decoded = r.readlines()[0]
      if decoded[0] == 'E':
        data['decode'] = None
      else:
        de = [d for d in decoded.replace(':', '').split(' ')[2:] if len(d) > 0]
        info = {de[i]: de[i+1] for i in range(0, len(de), 2)}
        info['imm'] = int(info['imm'], 16)
        if info['imm'] & 0x80000000:
          info['imm'] = info['imm'] - 0xffffffff - 1
        data['decode'] = info
    print(data)


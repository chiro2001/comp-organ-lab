import os

index = 0
with os.popen("riscv64-linux-gnu-objdump -d calc") as f:
  lines = f.readlines()
  # lines = [line for line in lines if len(line) > 20 and line[8] == ':']
  # lines = [line.split(':')[-1].strip() for line in lines]
  for line in lines:
    if len(line.strip()) == 0:
      continue
    if not (len(line) > 20 and line[8] == ':'):
      print(line)
      continue
    line = line.split(':')[-1].strip()
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
        imm_raw = info['imm']
        if info['imm'] & 0x80000000:
          info['imm'] = info['imm'] - 0xffffffff - 1
        if '0x' in data['code']:
          info['imm'] = f"{info['imm']}({hex(imm_raw)})"
        data['decode'] = info
    print("%3x: " % index + data['code'] + '\t' * (5 - (len(data['code']) + 6) // 8) + f"{data['inst']:08x} " + str(data['decode']).replace('{', '').replace('}', '').replace("'", ''))
    index += 4


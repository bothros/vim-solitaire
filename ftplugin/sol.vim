if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

python <<EOF
def _roll():
    import vim, random
    print "ROLLED: {}".format(random.randint(1, 6))

def _insert_dice():
    import vim, random, re
    dice_pattern = re.compile('([0-9]+)d([0-9]+)')
    match = dice_pattern.search(vim.current.line)

    n = int(match.group(1))
    s = int(match.group(2))

    rolls = [random.randint(1, s) for _ in xrange(n)]
    total = sum(rolls)

    print "ROLLED: " + " + ".join([str(r) for r in rolls]) + " = " + str(total)

    vim.current.line = vim.current.line[:match.start()] + str(total) + vim.current.line[match.end():]

def _decide():
    import vim, random, re
    chance_pattern = re.compile('([0-6])/6')
    chance = int(chance_pattern.search(vim.current.line).group(1))

    roll = random.randint(1, 6)
    print "ROLLED: {}".format(roll)

    if roll <= chance:
        vim.current.line += ' T'
    else:
        vim.current.line += ' F'
EOF


command Roll :python _roll()
command Decide :python _decide()
command InsertDice :python _insert_dice()

nnoremap gr :Decide<CR>
nnoremap gi :InsertDice<CR>


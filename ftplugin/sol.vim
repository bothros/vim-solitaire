if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

python <<EOF
def _roll():
    import vim, random
    print "ROLLED: {}".format(random.randint(1, 6))

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

nnoremap gr :Decide<CR>


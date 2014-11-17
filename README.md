This is a vim plugin for playing Mark Johnson's [solitaire RPG](http://indie-rpgs.com/archive/index.php?topic=7632.msg79893#msg79893).

It does statement highlighting and dice rolling.

It recognizes files ending with the extension '.sol' .

Begin comments like this:

    # I'm going to play Mark Johnson's solitaire RPG!

Put propositions each on their own line. End with T if the proposition is true, and F if the proposition is false. If you end with an x/6 chance, you can use Shift-R to have vim roll a die and mark it for you. Like this:

    John is an orc. T
    John likes pie. 3/6 F
    John hates pie, because he has to guard it. 4/6 #This is where I press Shift-R

Requires vim to be compiled with +python.

This program is supposed to end up to be "FizzBuzz" written in Brainfuck

Print the numbers from 1 to 100 but for multiples of three print "Fizz"
instead of the number and for the multiples of five print "Buzz"

When numbers are both multiples of three and five print "FizzBuzz"

################################################################################
###

+++++ +++++             c0          : Set up the counter to a value of 10
[
  >> +++++ +++++        c2          : Increment the cell by 10
  << -                  c0          : Decrement the cell by 1
]

At this point cell 2 is 100; datapointer is now at cell 0

################################################################################
###

+++++ +++++             c0          : Set cell 0 to the ASCII \n character

>                       c1
+++++ +++++             c1
+++++ +++++             c1
+++++ +++++             c1
++                      c1          : Set cell 2 to the ASCII ' ' character

################################################################################

################################################################################
###
>>                      c3

+++++ +++++             c3          : Set the value to 10

[
  > +++++               c4          : Increment by five
  < -                   c3          : Decrement the counter
]

> -                     c4          : Decrement c4 from 50 for 49 (ascii "1")
                                    : this will be used as the offset for
                                    : printing

################################################################################
### Start the loop through 1 to 10 and print
<<< ..                  c1          : Jump to cell one to print two leading spaces
>>> .                   c4          : Print '1'

< +++++ +++             c3          : Set a counter to 8 to get 1 through 9 printed

[
  <<< .                 c0          : Jump to and print cell 0 (\n)
  > ..                  c1          : Print two leading spaces
  >>> + .               c4          : Increment cell 4 and print it
  < -                   c3          : Decrement cell 3
]

> ----- ----            c4          : Bring cell four back to ascii '0'


<<<< .                  c0          : Print a newline after the last 9


################################################################################
### Start the loop through 100

>>>>> +++++ +++++       c5           : Set cell five to the ASCII '1'
      +++++ +++++
      +++++ +++++
      +++++ +++++
      +++++ ++++

<<                      c3
+++++ +++++             c3          : Pre-seed the counter with 10


[
  -
  <<<                   c0          : Jumping to cell zero just to give myself a clean slate


  >>>>>> +++++ +++++    c6          : Set cell 6 to our nested loop counter
  [
    -                   c6          : Decrement counter by one
    <<<<< .             c1          : Print a leading space
    >>>>                c5
    .
    >                   c6

    << . +              c4          : Print our last digit and increment it
    >>                  c6

    <<<<<< .            c0          : Jump to cell zero to print a newline
    >>>>>>              c6
  ]

  < +                   c5          : Increment second digit column in c5
  >                     c6

  << ----- -----        c4          : Clear our last digit printer column
  >>

  <<<<<<                c0

  >>>                   c3
]

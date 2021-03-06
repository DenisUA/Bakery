## General Info

To run application:<br/>
`ruby app.rb <input_file_path>`<br/>

To run tests:<br/>
`bundle`<br/>
`rspec`

## Challenge description

### Background:
    
A bakery used to base the price of their produce on an individual item cost. So if a customer ordered 10

cross buns then they would be charged 10x the cost of single bun. The bakery has decided to start

selling their produce prepackaged in bunches and charging the customer on a per pack basis. So if the

shop sold vegemite scroll in packs of 3 and 5 and a customer ordered 8 they would get a pack of 3 and

a pack of 5. The bakery currently sells the following products:

| Name             | Code | Packs                           |
|------------------|------|---------------------------------|
| Vegemite Scroll  | VS5  | 3 @ $6.99 <br>5 @ $8.99
| Blueberry Muffin | MB11 | 2 @ $9.95 <br>5 @ $16.95 <br>8 @ $24.95 |
| Croissant        | CF   | 3 @ $5.95 <br>5 @ $9.95 <br>9 @ $16.99  |

### Task:

Given a customer order you are required to determine the cost and pack breakdown for each product.

To save on shipping space each order should contain the minimal number of packs.

### Input:

Each order has a series of lines with each line containing the number of items followed by the product
code. An example input:

10 VS5

14 MB11

13 CF

### Output:
    
A successfully passing test(s) that demonstrates the following output:

10 VS5 $17.98

2 x 5 $8.99
    
14 MB11 $54.8

1 x 8 $24.95

3 x 2 $9.95

13 CF $25.85

2 x 5 $9.95

1 x 3 $5.95

### INPUT AND OUTPUT

*Test Input:*
```
10 VS5

14 MB11

13 CF
```

*Expected Output:*
```
10 VS5 $ 17.98
  2 x 5 $ 8.99
14 MB11 $ 54.8
  1 x 8 $ 24.95
  3 x 2 $ 9.95
13 CF $ 25.85
  2 x 5 $ 9.95
  1 x 3 $ 5.95
21 VS5 $ 40.95
  3 x 5 $ 8.99
  2 x 3 $ 6.99
27 MB11 $ 94.7
  5 x 5 $ 16.95
  1 x 2 $ 9.95
28 CF $ 53.88
  2 x 9 $ 16.99
  2 x 5 $ 9.95
```

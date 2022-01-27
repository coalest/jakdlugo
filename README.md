# Jakdlugo

This gem is a simple command line tool for Launch School students to estimate how long the curriculum will take.

## How it works
A common question LS students have is "How long does Launch School take?", so there is a post in the forums where students answer how long it took for them. This gem takes the data from that forum post, loads it into a Postgres database and provides a few subcommands that query that database.

The original name for this gem "how long" was taken, so "jak długo" is the Polish translation.

## Usage

Get general usage information:

    $ jakdlugo --help

```
A command line tool to estimate how long courses at Launch School
will take.

Commands:

-c, --course [COURSE]           :Show data about a specific course
-t, --track [TRACK]             :Show data about ruby or javascript track
-p, --progress [TRACK] [COURSE] :Show your progress to finishing Core
```

Get data on a specific course:

    $ jakdlugo -c rb101
```
    Course: RB101/RB109
    Average number of study hours to complete: 187
    Data points (n=12): 78, 102, 109, 114, 127, 149, 165, 190, 233, 282, 307, 382
```
Get data on your progress:

    $ jakdlugo -p js ls215

`When you finish LS215/LS216, you will be approx. 80% done with Core!`

Get data on an LS track:

    $ jakdlugo -t ruby

```
   Course    | Average number | Percent of
             |    of hours    | total time
-------------|----------------|------------
 LS95        |       23       |    1.8
 RB100       |       43       |    3.4
 RB101/RB109 |       187      |    14.6
...
...
...
```

## Installation

Install it with:

    $ gem install jakdlugo

## To Do

- [ ] Write tests!
- [ ] Add feature to estimate remaining number of hours for a student.
- [ ] Improve the formatting of outputs.

## Contributing

Please contribute!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

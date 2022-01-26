# Jakdlugo

A simple command line tool for Launch School students. A common question students have is "How long does Launch School take?". To answer this question, there is a post in the LS forums where students answer how long the Core curriculum took for them. This gem includes the data from that forum post, and provides a few commands to summarize that information.

The original name for this gem was taken "howlong", so I translated it to Polish.

## Installation

Install it with:

    $ gem install jakdlugo

## Usage

    $ jakdlugo --help

```
A command line tool to estimate how long courses at Launch School
will take.

Commands:

-c, --course [COURSE]           :Show data about a specific course
-t, --track [TRACK]             :Show data about ruby or javascript track
-p, --progress [TRACK] [COURSE] :Show your progress to finishing Core
```

Get information on a specific course:

    $ jakdlugo -c rb101
```
    Course: RB101/RB109
    Average number of study hours to complete: 187
    Data points (n=12): 78, 102, 109, 114, 127, 149, 165, 190, 233, 282, 307, 382
```
Get information on your progress:

    $ jakdlugo -p js ls215

`When you finish LS215/LS216, you will be approx. 80% done with Core!`

Get information on the entire ruby or javascript track:

    $ jakdlugo -p js ls215

`When you finish LS215/LS216, you will be approx. 80% done with Core!`

## To Do

- [ ] Write tests!
- [ ] Add feature to estimate remaining number of hours for a student.
- [ ] Improve the formatting of outputs.

## Contributing


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

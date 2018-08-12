
## Installation
NB these instructions will not apply until the gem has been uploaded to RubyGems.

Add this line to your application's Gemfile:

```ruby
gem 'exchange_rate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exchange_rate

## Tests
From `root folder`: 
(NB the complete suite and integration tests will kick off a file download, so only run if you have an internet connection)
- Complete test suite: `rspec` 
- Unit tests: `rspec spec/unit`
- Integration tests: `rspec spec/integration` 
- Acceptance tests: `rspec spec/acceptance`


## Cron jobs
Cron jobs were written using the [whenever](https://github.com/javan/whenever) gem.

To run the cron, open 'lib/config/schedule.rb' and replace with 'root' variable with the your own path to the 'exchange_root' directory.
Run `whenever --update-crontab`

NB The cron is set to run daily at 3am so if you want to see it in action, change `every 1.day, at: '3:00am' do`
to `every 1.minute do` and run `whenever --update-crontab` and `tail -f /var/log/cron_log.log`.


The `DataRetriever` class can also be used to manually download the xml file.

## Assumptions
In a job situation, I would clarify these assumptions but I decided that for the purposes of a tech test I could safely assume the following:
- Rates should be kept only for the previous 90 days
- Storing in a local file (as opposed to a DB) is fine
- I did not need to choose a production-level API to use but simply provide the functionality to plug in. 
(Many of the production
level APIs I looked at (eg [OpenExchange](https://openexchangerates.org)) used JSON so there would be some different configuration but not much.)


## Design Process
- Used event storming to get a full sense of the domain. While this library is solely to 
get exchange rates and not to calculate currency conversion, I did storm the process from the UI
to get a full sense of the client's needs.

![alt text](./documentation/images/event_storm.jpg "Event Storm")


- Created a [Trello board](https://trello.com/b/6MhqTW2p/fx-library-kanban) to make tickets and track my work. If this were in a job setting, I would work on separate branches but
as I am the only developer, I worked on a single branch. 

- Used TDD to build the library. I was originally trained at Makers in TDD so I am very comfortable with the process. Having recently been working through Ken Beck's TDD by Example and participated in workshops by Mathias Verraes,
this was a really interesting opportunity to introduce value objects with the TDD as a way of building the design.

- Assumed for the sake of argument that the production API would use JSON, so created a skeleton class/tests for production

- As this is a tech test, in order to preserve confidentiality I have not published it on RubyGems.

## Design Considerations
- Use of value objects both guarantees objects' correct internal state, reducing the number of tests needed 
and also means the objects themselves are immutable, both of which provide further safety.
- Use of interfaces to tightly encapsulate communication. This would make it simple to plug in whatever production-level API is chosen (in `exchange_rate.rb` line 17 `    parser = XMLParser.new
`)
- Design based on sending messages rather than creating objects, as described in POODR
- While the use of the Ruby gem `whenever` was a nice touch for the cronjob, there were issues with testing this file. I had bugs with the `whenever-test` gem, and eventually reached out to its
maker on Twitter, who told me he's no longer maintaining it (but did offer to make me a maintainer!). I decided that for this project, building
a test framework was out of scope but I would expect that this file be fully tested in production.

## Further improvements
- implement a test framework for the `schedule.rb`
- more robust cron job handling (more relevant if this is running on a server rather than a local computer!):
    * automatic retry if download failure
    * error logging
    * error alerting
    * (event storming was very instructive here, as the first time the cron fails is different from the second time - the first time
    could log an error and generate an automatic immediate retry, but the second time could log an error and try again in ten minutes,
    and the third time generate an alert etc)
- pre-commit hook to run test suite
- configure rubocop to disable
    * class documentation comments  
- use the DataRetriever class in the cron job


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrencyExchanger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://communitycodeofconduct.com/).

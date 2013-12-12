Quick overview of some new stuff in Riak 2.0
============================================

Talk about Riak 2.0 at [Munich Riak UG](http://www.meetup.com/Riak-Munchen/) on
11.12.2013. Slides with more links to talks are on [Slideshare](http://www.slideshare.net/philippfehre/what-is-new-in-riak-20)

Setup
-----
All the code was run against
[Riak 2.0.0pre5](http://docs.basho.com/riak/2.0.0pre5/downloads/) so I encourage
everybody to try the examples yourself. All you need is a recent ruby (tested on
2.0). And a running Riak with yokozuna.

1. Download Riak 2.0.0pre5
2. Edit the riak.conf file in $RIAKDIR/etc/riak.conf and change to the following
    ```
    yokozuna = on

    storage_backend = leveldb
    ```
3. Start Riak $RIAKDIR/bin/riak start

Solr Demos
----------
All the following is done in the directory ```solr_examples```

1. Create an index for Solr via the included script
  ```
  bash create_index.sh
  ```
2. Associate the index with the cities bucket
  ```
  bash associate_index.sh
  ```
3. Get all the dependencies
  ```
  bundle install
  ```
4. Import the dataset
  ```
  ruby import.rb
  ```

Now you can query riak via the browser here are some examples

* [all the cities](http://localhost:8098/search/cities?q=*:*&wt=json)
* [cities which start with a](http://localhost:8098/search/cities?q=city_s:a*&wt=json)
* [cities with a sorted by population](http://localhost:8098/search/cities?q=city_s:a*&wt=json&sort=population_i%20desc)
* [cities in a 100km radius from munich](http://localhost:8098/search/cities?q=*:*&wt=json&fq={!geofilt%20pt=48.1500,11.5833%20sfield=location_p%20d=100}&sort=population_i%20desc)

CRDT examples using [Meangirls](https://github.com/aphyr/meangirls)
-------------------------------------------------------------------
All the following is done in the directory ```crdts_examples_ruby```

1. Install all the dependencies
  ```
  bundle install
  ```
2. run the examples
  ```
  ruby gcounter.rb
  ```
and 
  ```
  ruby or_set.rb
  ```

Some more links about the CRDTs in depth
* [The pullrequest](https://github.com/basho/riak/issues/354)
* [A paper](http://arxiv.org/pdf/1210.3368.pdf)





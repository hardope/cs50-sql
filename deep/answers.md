# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Advantages:

    Observations are evenly distributed across the boats because of the randomness.
    Easy to implement with minimal computation overhead.

Disadvantages:

    Queries for specific ranges must be run on all boats, leading to increased query latency and inefficiency.
    Absense of data locality can result in slower query performance for grouped data.



## Partitioning by Hour

Advantages:

    Observations within specific time ranges are localized to a single boat, reducing the number of boats queried for time-based searches.
    More efficient for time-bound queries, such as finding all observations from midnight to 1am.

Disadvantages:

    Skewed data collection times (e.g., a majority of observations occurring between midnight and 1am) can overload some boats, reducing performance and causing imbalance.
    Requires careful adjustment of time ranges if observation patterns change over a period time.

## Partitioning by Hash Value

Advantages:

    Even distribution of data across boats ensures balanced storage and eliminates the risks overload.
    Queries for a specific observation (e.g., an exact timestamp) can be directed to one boat, reducing otherwise unnecessary data scans.

Disadvantages:

    Queries for a range of observations (e.g., all timestamps between midnight and 1am) must still involve all boats, as hash values are not contiguous for time ranges.
    Increased complexity in managing and maintaining the hash function and debugging related issues.
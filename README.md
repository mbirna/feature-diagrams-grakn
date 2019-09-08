# feature-diagrams-grakn

########################################################################
# Project Name:     Feature Diagrams for Behaviour Support Agents in GRAKN
# Creator:     		Dr. M. Birna van Riemsdijk, based on work with Prof. Dr. Marielle Stoelinga and Dr. Malte Kliess
# Publisher:   		Delft University of Technology, University of Twente
# Created:     		2019-09
# License: 	   		GNU GPLv3
########################################################################

# Description

This project contains the GRAKN (version 1.5.3 for Mac) code accompanying the publication of the paper "From good intentions to behaviour change: Probabilistic Feature Diagrams for Behaviour Support Agents", accepted for The 22nd International Conference on Principles and Practice of Multi-Agent Systems (PRIMA'19), by Malte Kliess, Marielle Stoelinga, and M. Birna van Riemsdijk.

The file feature-diagrams-grakn-prima19.gql contains the main GRAKN code. The file edited_hh104_labour.gql contains the dataset data/editedhh104labour.xes.gz from the repository https://data.4tu.nl/repository/uuid:01eaba9f-d3ed-4e04-9945-b8b302764176, translated to GRAKN insert statements using XSLT (file activity-trace-to-grakn-labour.xslt).

# Usage

To use the programme, load the two .gql file into a GRAKN keyspace. To count the number of days a behaviour has been performed, the following query can be used (replace "early-breakfast" with the corresponding behaviour-name for counting the other behaviours in the example feature diagram). Note: the compositional node-semantics (e.g., the mandatory links for the root node) has not been implemented yet, however, since all non-leaf nodes are satisfied on all days in the example feature diagram, this was not needed for this example. Future work will address this.

match (performed-activity: $a, observed-event: $e) isa performed-activity-through-event; $e has event-date $d; $a has activity-name $n; $n == "early-breakfast"; get $d; count;

 

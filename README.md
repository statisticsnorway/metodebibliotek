Metodebibliotek ![Code Library](viz/codelibrary_ssb.png)
========================================================

#### Statistics Norway’s library for methods’ code

This list contains the names of methodological functions which may be
useful in creating official statistics. All functions are open source in
either R or python, although some call other programs in the background
(eg JDemtra).

For technical help on the methods library and calling functions, see the
[technical help file](help/technical.md).

### Catalogue

Below is a list of functions in Statistic Norway’s Metodebibliotek. It
contains a short description of each function with a link to further
documentation. If you want the list in table format [click
here](help/metodebib_tabell.md)

#### **Design**

This phase describes the development and design activities, and any
associated practical research work needed to define the statistical
outputs, concepts, methodologies, collection instruments and operational
processes.

The
[GetKlass](https://www.rdocumentation.org/packages/klassR/versions/0.1.2/topics/GetKlass)
function is written in R. Retrieves classifications and codelists from
Klass

#### **Collect**

This phase collects or gathers all necessary information (e.g. data,
metadata and paradata), using different collection modes
(e.g. acquisition, collection, extraction, transfer), and loads them
into the appropriate environment for further processing.

The [Dataset](https://pypi.org/project/pyjstat/) function is written in
Python. Create class instance of a json dataset

#### **Process**

This phase describes the processing of input data and their preparation
for analysis.

The
[GetKlass](https://www.rdocumentation.org/packages/klassR/versions/0.1.2/topics/GetKlass)
function is written in R. Retrieves classifications and codelists from
Klass  
The
[PanelEstimation](https://www.rdocumentation.org/packages/CalibrateSSB/versions/1.3.0/topics/PanelEstimation)
function is written in R. Variance estimation for panel data  
The [Dataset](https://pypi.org/project/pyjstat/) function is written in
Python. Create class instance of a json dataset

#### **Analyse**

In this phase, statistical outputs are produced and examined in detail.
It includes preparing statistical content (including commentary,
technical notes, etc.), and ensuring outputs are “fit for purpose” prior
to dissemination to users.

#### **Disseminate**

This phase manages the release of the statistical products to users. It
includes all activities associated with assembling and releasing a range
of static and dynamic products via a range of channels.

The
[GetKlass](https://www.rdocumentation.org/packages/klassR/versions/0.1.2/topics/GetKlass)
function is written in R. Retrieves classifications and codelists from
Klass

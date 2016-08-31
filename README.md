drupalcs
============

Usage
--------------------

1. Install the `dots/drupalcs` container (optional - this step is performed by Docker automatically when running the container):

    ``` sh
    $ docker pull dots/drupalcs
    ```

2.  Generate a coder report for the current directory

    ``` sh
    $ docker run --rm -v "$(PWD)":/workspace -it dots/drupalcs >> coder_report.txt
    ```

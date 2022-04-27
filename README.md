# Utility_Shell

- Collection of `shell scripts/commands` for cases 
  - env set up 
  - system config 
  - file/data manipulation  
  - useful bash scripts
  - others

## File Structure

<details>
<summary>File Structure</summary>
	
```bash
├── GPG
├── Jenkins
├── README.md
├── Vagrant
├── airflow
├── alembic
├── archived
├── bq
├── cat
├── centos
├── check_ip.sh
├── command_menu.sh
├── create_yaml_with_pass.sh
├── data
├── dbt
├── df_test.csv
├── docker
├── elk
├── emr
├── file_op
├── flink
├── gcloud
├── git_github
├── hadoop
├── hive
├── intellij
├── internet
├── iterm
├── json_csv_xml_txt
├── k8s
├── kafka
├── linux
├── mac_osx
├── mac_osx_m1
├── mac_ubuntu
├── maven_
├── mongo
├── mysql
├── network
├── pig
├── pipeline
├── postgre
├── redis
├── redshift
├── regular_expressions
├── s3_ops
├── sbt
├── snowflake
├── spark
├── sql_sever_database
├── sqlite
├── string_op
├── text
├── ubuntu_ops
└── yarn
```
	
</details>
	
## RUN DEMO 

<details>
<summary>RUN DEMO</summary>


```bash
# run the demo shell
$ bash system_info.sh
# output 
***********************************

      System Information for yennanliude-MacBook-Pro.local

      Updated on 05/26/18 10:27:18 AM BST by yennanliu
      <h2>System release info</h2>
<p>Function not yet implemented</p>
      <h2>System uptime</h2>
<pre>
10:27  up 12:52, 6 users, load averages: 1.86 2.21 2.18
</pre>
      <h2>Filesystem space</h2>
<pre>
Filesystem    512-blocks      Used Available Capacity iused               ifree %iused  Mounted on
/dev/disk1s1   236568496 180693320  44086368    81% 1722199 9223372036853053608    0%   /
devfs                375       375         0   100%     649                   0  100%   /dev
/dev/disk1s4   236568496  10485976  44086368    20%       5 9223372036854775802    0%   /private/var/vm
map -hosts             0         0         0   100%       0                   0  100%   /net
map auto_home          0         0         0   100%       0                   0  100%   /home
</pre>
      
***********************************
```

```bash
bash spark/install_pyspark.sh
# output
/Users/yennanl/utility_shell/spark
>>>> STEP 1)  set dev env
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.5.4
  latest version: 4.5.11

Please update conda by running

    $ conda update -n base conda



## Package Plan ##

  environment location: /Users/yennanl/anaconda3/envs/pyspark_dev

  added / updated specs: 
    - python=3.5


The following NEW packages will be INSTALLED:

    ca-certificates: 2018.03.07-0           
    certifi:         2018.8.24-py35_1       
    libcxx:          4.0.1-hcfea43d_1       
    libcxxabi:       4.0.1-hcfea43d_1       
    libedit:         3.1.20170329-hb402a30_2
    libffi:          3.2.1-h475c297_4       
    ncurses:         6.1-h0a44026_1         
    openssl:         1.0.2p-h1de35cc_0      
    pip:             10.0.1-py35_0          
    python:          3.5.6-hc167b69_0       
    readline:        7.0-h1de35cc_5         
    setuptools:      40.2.0-py35_0          
    sqlite:          3.25.3-ha441bb4_0      
    tk:              8.6.8-ha441bb4_0       
    wheel:           0.31.1-py35_0          
    xz:              5.2.4-h1de35cc_4       
    zlib:            1.2.11-h1de35cc_3      

Proceed ([y]/n)? y

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate pyspark_dev
#
# To deactivate an active environment, use
#
#     $ conda deactivate

>>>> STEP 2)  install pyspark
tar: Error opening archive: Failed to open '/Users/yennanl/utility_shell/spark/Downloads/spark-2.3.0-bin-hadoop2.7.tgz'
mv: rename /Users/yennanl/utility_shell/spark/Downloads/spark-2.3.0-bin-hadoop2.7 to /Users/yennanl/utility_shell/spark/spark-2.3.0-bin-hadoop2.7: No such file or directory
cp: /Users/yennanl/utility_shell/spark/spark-2.3.0-bin-hadoop2.7: No such file or directory
Collecting pyspark
  Downloading https://files.pythonhosted.org/packages/88/01/a37e827c2d80c6a754e40e99b9826d978b55254cc6c6672b5b08f2e18a7f/pyspark-2.4.0.tar.gz (213.4MB)
    100% |████████████████████████████████| 213.4MB 113kB/s 
Collecting py4j==0.10.7 (from pyspark)
  Using cached https://files.pythonhosted.org/packages/e3/53/c737818eb9a7dc32a7cd4f1396e787bd94200c3997c72c1dbe028587bd76/py4j-0.10.7-py2.py3-none-any.whl
Building wheels for collected packages: pyspark
  Running setup.py bdist_wheel for pyspark ... done
  Stored in directory: /Users/yennanl/Library/Caches/pip/wheels/cd/54/c2/abfcc942eddeaa7101228ebd6127a30dbdf903c72db4235b23
Successfully built pyspark
Installing collected packages: py4j, pyspark
Successfully installed py4j-0.10.7 pyspark-2.4.0
You are using pip version 10.0.1, however version 18.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
>>>> STEP 3)  declare env parameter
>>>> STEP 4)  install jupyter notebook
Collecting jupyter
  Using cached https://files.pythonhosted.org/packages/83/df/0f5dd132200728a86190397e1ea87cd76244e42d39ec5e88efd25b2abd7e/jupyter-1.0.0-py2.py3-none-any.whl
Collecting jupyter-console (from jupyter)
  Using cached https://files.pythonhosted.org/packages/cb/ee/6374ae8c21b7d0847f9c3722dcdfac986b8e54fa9ad9ea66e1eb6320d2b8/jupyter_console-6.0.0-py2.py3-none-any.whl
Collecting notebook (from jupyter)
  Using cached https://files.pythonhosted.org/packages/a2/5d/d1907cd32ac00b5ead56f6e61d9794fa60ef105a22ac5da6e7556011580f/notebook-5.7.2-py2.py3-none-any.whl
Collecting qtconsole (from jupyter)
  Using cached https://files.pythonhosted.org/packages/e0/7a/8aefbc0ed078dec7951ac9a06dcd1869243ecd7bcbce26fa47bf5e469a8f/qtconsole-4.4.3-py2.py3-none-any.whl
Collecting ipykernel (from jupyter)
  Using cached https://files.pythonhosted.org/packages/d8/b0/f0be5c5ab335196f5cce96e5b889a4fcf5bfe462eb0acc05cd7e2caf65eb/ipykernel-5.1.0-py3-none-any.whl
Collecting nbconvert (from jupyter)
  Using cached https://files.pythonhosted.org/packages/b5/bb/94c493051d60e5b9c0f7f9a368b324201818c1b1c4cae85d1e49a41846c7/nbconvert-5.4.0-py2.py3-none-any.whl
Collecting ipywidgets (from jupyter)
  Using cached https://files.pythonhosted.org/packages/30/9a/a008c7b1183fac9e52066d80a379b3c64eab535bd9d86cdc29a0b766fd82/ipywidgets-7.4.2-py2.py3-none-any.whl
Collecting jupyter-client (from jupyter-console->jupyter)
  Downloading https://files.pythonhosted.org/packages/3b/c3/3043fe9ffd140d03c9d091a056794ccdc427c56ec19b8eea74f9ea0a498f/jupyter_client-5.2.4-py2.py3-none-any.whl (89kB)
    100% |████████████████████████████████| 92kB 3.4MB/s 
Collecting pygments (from jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/fc/41/4f900a7852e25bb9350b4e3ee8c4aba0ee32abefd401456962b25f954823/Pygments-2.3.0-py2.py3-none-any.whl
Collecting ipython (from jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/f0/b4/a9ea018c73a84ee6280b2e94a1a6af8d63e45903eac2da0640fa63bca4db/ipython-7.2.0-py3-none-any.whl
Collecting prompt-toolkit<2.1.0,>=2.0.0 (from jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/d1/e6/adb3be5576f5d27c6faa33f1e9fea8fe5dbd9351db12148de948507e352c/prompt_toolkit-2.0.7-py3-none-any.whl
Collecting tornado>=4 (from notebook->jupyter)
Collecting prometheus-client (from notebook->jupyter)
  Downloading https://files.pythonhosted.org/packages/bc/e1/3cddac03c8992815519c5f50493097f6508fa153d067b494db8ab5e9c4ce/prometheus_client-0.5.0.tar.gz
Collecting terminado>=0.8.1 (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/2e/20/a26211a24425923d46e1213b376a6ee60dc30bcdf1b0c345e2c3769deb1c/terminado-0.8.1-py2.py3-none-any.whl
Collecting jupyter-core>=4.4.0 (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/1d/44/065d2d7bae7bebc06f1dd70d23c36da8c50c0f08b4236716743d706762a8/jupyter_core-4.4.0-py2.py3-none-any.whl
Collecting jinja2 (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/7f/ff/ae64bacdfc95f27a016a7bed8e8686763ba4d277a78ca76f32659220a731/Jinja2-2.10-py2.py3-none-any.whl
Collecting traitlets>=4.2.1 (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/93/d6/abcb22de61d78e2fc3959c964628a5771e47e7cc60d53e9342e21ed6cc9a/traitlets-4.3.2-py2.py3-none-any.whl
Collecting nbformat (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/da/27/9a654d2b6cc1eaa517d1c5a4405166c7f6d72f04f6e7eea41855fe808a46/nbformat-4.4.0-py2.py3-none-any.whl
Collecting pyzmq>=17 (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/14/a5/66d5c3240d2ff92e6dd8e4a0e8bdabc3813d98980e27a6e5d4cfd9c60767/pyzmq-17.1.2-cp35-cp35m-macosx_10_6_intel.whl
Collecting Send2Trash (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/49/46/c3dc27481d1cc57b9385aff41c474ceb7714f7935b1247194adae45db714/Send2Trash-1.5.0-py3-none-any.whl
Collecting ipython-genutils (from notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/fa/bc/9bd3b5c2b4774d5f33b2d544f1460be9df7df2fe42f352135381c347c69a/ipython_genutils-0.2.0-py2.py3-none-any.whl
Collecting testpath (from nbconvert->jupyter)
  Using cached https://files.pythonhosted.org/packages/be/a4/162f9ebb6489421fe46dcca2ae420369edfee4b563c668d93cb4605d12ba/testpath-0.4.2-py2.py3-none-any.whl
Collecting mistune>=0.8.1 (from nbconvert->jupyter)
  Using cached https://files.pythonhosted.org/packages/09/ec/4b43dae793655b7d8a25f76119624350b4d65eb663459eb9603d7f1f0345/mistune-0.8.4-py2.py3-none-any.whl
Collecting bleach (from nbconvert->jupyter)
  Using cached https://files.pythonhosted.org/packages/d4/0d/4696373c3b714f6022d668fbab619690a42050dbeacede6d10ed97fbd3e2/bleach-3.0.2-py2.py3-none-any.whl
Collecting entrypoints>=0.2.2 (from nbconvert->jupyter)
  Using cached https://files.pythonhosted.org/packages/cc/8b/4eefa9b47f1910b3d2081da67726b066e379b04ca897acfe9f92bac56147/entrypoints-0.2.3-py2.py3-none-any.whl
Collecting defusedxml (from nbconvert->jupyter)
  Using cached https://files.pythonhosted.org/packages/87/1c/17f3e3935a913dfe2a5ca85fa5ccbef366bfd82eb318b1f75dadbf0affca/defusedxml-0.5.0-py2.py3-none-any.whl
Collecting pandocfilters>=1.4.1 (from nbconvert->jupyter)
Collecting widgetsnbextension~=3.4.0 (from ipywidgets->jupyter)
  Using cached https://files.pythonhosted.org/packages/8a/81/35789a3952afb48238289171728072d26d6e76649ddc8b3588657a2d78c1/widgetsnbextension-3.4.2-py2.py3-none-any.whl
Collecting python-dateutil>=2.1 (from jupyter-client->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/74/68/d87d9b36af36f44254a8d512cbfc48369103a3b9e474be9bdfe536abfc45/python_dateutil-2.7.5-py2.py3-none-any.whl
Collecting decorator (from ipython->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/bc/bb/a24838832ba35baf52f32ab1a49b906b5f82fb7c76b2f6a7e35e140bac30/decorator-4.3.0-py2.py3-none-any.whl
Collecting backcall (from ipython->jupyter-console->jupyter)
Collecting pexpect; sys_platform != "win32" (from ipython->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/89/e6/b5a1de8b0cc4e07ca1b305a4fcc3f9806025c1b651ea302646341222f88b/pexpect-4.6.0-py2.py3-none-any.whl
Collecting pickleshare (from ipython->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/9a/41/220f49aaea88bc6fa6cba8d05ecf24676326156c23b991e80b3f2fc24c77/pickleshare-0.7.5-py2.py3-none-any.whl
Collecting jedi>=0.10 (from ipython->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/7a/1a/9bd24a185873b998611c2d8d4fb15cd5e8a879ead36355df7ee53e9111bf/jedi-0.13.1-py2.py3-none-any.whl
Collecting appnope; sys_platform == "darwin" (from ipython->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/87/a9/7985e6a53402f294c8f0e8eff3151a83f1fb901fa92909bb3ff29b4d22af/appnope-0.1.0-py2.py3-none-any.whl
Requirement already satisfied: setuptools>=18.5 in ./anaconda3/envs/pyspark_dev/lib/python3.5/site-packages (from ipython->jupyter-console->jupyter) (40.2.0)
Collecting six>=1.9.0 (from prompt-toolkit<2.1.0,>=2.0.0->jupyter-console->jupyter)
  Downloading https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl
Collecting wcwidth (from prompt-toolkit<2.1.0,>=2.0.0->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/7e/9f/526a6947247599b084ee5232e4f9190a38f398d7300d866af3ab571a5bfe/wcwidth-0.1.7-py2.py3-none-any.whl
Collecting ptyprocess; os_name != "nt" (from terminado>=0.8.1->notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/d1/29/605c2cc68a9992d18dada28206eeada56ea4bd07a239669da41674648b6f/ptyprocess-0.6.0-py2.py3-none-any.whl
Collecting MarkupSafe>=0.23 (from jinja2->notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/f3/14/57314fd91debce8e53b8efe662093915d88eccf00df026224dfe71d7518b/MarkupSafe-1.1.0-cp35-cp35m-macosx_10_6_intel.whl
Collecting jsonschema!=2.5.0,>=2.4 (from nbformat->notebook->jupyter)
  Using cached https://files.pythonhosted.org/packages/77/de/47e35a97b2b05c2fadbec67d44cfcdcd09b8086951b331d82de90d2912da/jsonschema-2.6.0-py2.py3-none-any.whl
Collecting webencodings (from bleach->nbconvert->jupyter)
  Using cached https://files.pythonhosted.org/packages/f4/24/2a3e3df732393fed8b3ebf2ec078f05546de641fe1b667ee316ec1dcf3b7/webencodings-0.5.1-py2.py3-none-any.whl
Collecting parso>=0.3.0 (from jedi>=0.10->ipython->jupyter-console->jupyter)
  Using cached https://files.pythonhosted.org/packages/09/51/9c48a46334be50c13d25a3afe55fa05c445699304c5ad32619de953a2305/parso-0.3.1-py2.py3-none-any.whl
Building wheels for collected packages: prometheus-client
  Running setup.py bdist_wheel for prometheus-client ... done
  Stored in directory: /Users/yennanl/Library/Caches/pip/wheels/1a/74/d7/dc59e0bf44fdfd6395c0076129453abf563e4aeca5d72c8574
Successfully built prometheus-client
Installing collected packages: decorator, ipython-genutils, six, traitlets, jupyter-core, pyzmq, tornado, python-dateutil, jupyter-client, wcwidth, prompt-toolkit, backcall, ptyprocess, pexpect, pickleshare, parso, jedi, appnope, pygments, ipython, ipykernel, jupyter-console, prometheus-client, terminado, MarkupSafe, jinja2, jsonschema, nbformat, testpath, mistune, webencodings, bleach, entrypoints, defusedxml, pandocfilters, nbconvert, Send2Trash, notebook, qtconsole, widgetsnbextension, ipywidgets, jupyter
Successfully installed MarkupSafe-1.1.0 Send2Trash-1.5.0 appnope-0.1.0 backcall-0.1.0 bleach-3.0.2 decorator-4.3.0 defusedxml-0.5.0 entrypoints-0.2.3 ipykernel-5.1.0 ipython-7.2.0 ipython-genutils-0.2.0 ipywidgets-7.4.2 jedi-0.13.1 jinja2-2.10 jsonschema-2.6.0 jupyter-1.0.0 jupyter-client-5.2.4 jupyter-console-6.0.0 jupyter-core-4.4.0 mistune-0.8.4 nbconvert-5.4.0 nbformat-4.4.0 notebook-5.7.2 pandocfilters-1.4.2 parso-0.3.1 pexpect-4.6.0 pickleshare-0.7.5 prometheus-client-0.5.0 prompt-toolkit-2.0.7 ptyprocess-0.6.0 pygments-2.3.0 python-dateutil-2.7.5 pyzmq-17.1.2 qtconsole-4.4.3 six-1.12.0 terminado-0.8.1 testpath-0.4.2 tornado-5.1.1 traitlets-4.3.2 wcwidth-0.1.7 webencodings-0.5.1 widgetsnbextension-3.4.2
You are using pip version 10.0.1, however version 18.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
usage: jupyter [-h] [--version] [--config-dir] [--data-dir] [--runtime-dir]
               [--paths] [--json]
               [subcommand]
jupyter: error: one of the arguments --version subcommand --config-dir --data-dir --runtime-dir --paths is required
######## SPARK INSTALL SUCCESS ########
PLEASE RUN it via cona env : pyspark_dev 
source activate pyspark_dev && export SPARK_HOME=/Users/$USER/spark && export PATH=$SPARK_HOME/bin:$PATH && pyspark
######## SPARK INSTALL SUCCESS ########

```
</details>

## Ref 

### Posgre
* Posgre UDF 
	* https://www.tutorialspoint.com/postgresql/postgresql_functions.htm
* PL/pgSQL turtorial 
	* https://w3resource.com/PostgreSQL/pl-pgsql-declarations.php
	* http://www.imada.sdu.dk/~jamik/db2-12/material/39-PL-pgSQL.pdf
* Posgre cursor 
	* http://www.postgresqltutorial.com/plpgsql-cursor/

### Shell OP
* use `sed` to find and  replace string in file
  * https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/

### TODO 

<details>
<summary>TODO</summary>

</details>

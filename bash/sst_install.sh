if [ ! -d ~/env ]; then
    mkdir ~/env;
fi;

echo 'export WORKON_HOME=$HOME/env' >> ~/.bash_profile
echo 'export VIRTUALENVWRAPPER_PYTHON=/opt/python-2.7/bin/python' >> ~/.bash_profile
echo 'export PATH=$PATH:/usr/local/phantomjs/1.8.1/bin' >> ~/.bash_profile
echo 'if [ -f /opt/python-2.5/bin/virtualenvwrapper.sh ]; then source /opt/python-2.5/bin/virtualenvwrapper.sh; fi;' >> ~/.bash_profile

source ~/.bash_profile

source /opt/python-2.5/bin/virtualenvwrapper.sh

mkvirtualenv --python=/opt/python-2.7/bin/python --no-site-packages ift

pip install nose;
pip install pyhamcrest;
pip install lettuce;

if [ ! -d ~/ift ]; then
    mkdir ~/ift;
fi;

cd ift;

git clone https://github.com/edwelker/mirror_selenium_simple_test.git
cd mirror_selenium_simple_test
python setup.py install
cd ..
rm -rf mirror_selenium_simple_test

pip freeze > requirements.txt;
curl -O https://raw.github.com/edwelker/functional_web_tests/master/example_tests/pm_mobile.py
sst-run -b PhantomJS pm_mobile
cd ..
deactivate

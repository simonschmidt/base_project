# coding: utf-8

from setuptools import setup, find_packages


setup(
    name='BaseProject',
    version='0.0.1',
    description='Base structure for future projects',
    license='MIT',
    classifiers=[
        'Private::Do Not Upload'
    ],
    packages=find_packages('src'),
    package_dir={'': 'src'}
)


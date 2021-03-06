#!/usr/bin/env python

"""
Copyright Google Inc. 2016
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

import apache_beam as beam

def my_grep(line, term):
   if line.startswith(term):
      yield line

PROJECT='my-test-project-270713' #project-id
BUCKET='lbarrera-1' #bucket-name
JOB_NAME='grepdata2bucket' #Job-Name in dataflow

def run():
   argv = [
      '--project={0}'.format(PROJECT),
      '--job_name={0}'.format(JOB_NAME),
      '--save_main_session',
      '--staging_location=gs://{0}/staging/'.format(BUCKET),
      '--temp_location=gs://{0}/staging/'.format(BUCKET),
      '--runner=DataflowRunner'
   ]

   p = beam.Pipeline(argv=argv)
   input = 'gs://{0}/javahelp/*.java'.format(BUCKET)
   output_prefix = 'gs://{0}/javahelp/output'.format(BUCKET)
   searchTerm = 'import'

   # In this section define steps of the job 
   # find all lines that contain the searchTerm
   (p
      | 'ReadJavaFiles' >> beam.io.ReadFromText(input)
      | 'FilterData' >> beam.FlatMap(lambda line: my_grep(line, searchTerm) )
      | 'WriteResults' >> beam.io.WriteToText(output_prefix)
   )

   p.run()

if __name__ == '__main__':
   run()

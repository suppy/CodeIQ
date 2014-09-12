﻿labels = ['recommended_label', 'description', 'apache_format', 'nginx_format'];

tsv ='''time	Time the request was received	%t	$time_local
host	Remote host	%h	$remote_addr
forwardedfor	X-Forwarded-For header	%{X-Forwarded-For}i	$http_x_forwarded_for
ident	Remote logname	%l	--
user	Remote user	%u	$remote_user
req	First line of request	%r	$request
method	Request method	%m	$request_method
uri	Request URI	%U%q	$request_uri
protocol	Requested Protocol (usually "HTTP/1.0" or "HTTP/1.1")	%H	$server_protocol
status	Status code	%>s	$status
size	Size of response in bytes, excluding HTTP headers.	%B (or '%b' for compatibility with combined format)	$body_bytes_sent
reqsize	Bytes received, including request and headers.	%I (mod_log_io required)	$request_length
referer	Referer header	%{Referer}i	$http_referer
ua	User-Agent header	%{User-agent}i	$http_user_agent
vhost	Host header	%{Host}i	$host
reqtime_microsec	The time taken to serve the request, in microseconds	%D	--
reqtime	The time taken to serve the request, in seconds	%T	$request_time
cache	X-Cache header	%{X-Cache}o	$upstream_http_x_cache
runtime	Execution time for processing some request, e.g. X-Runtime header for application server or processing time of SQL for DB server.	%{X-Runtime}o	$upstream_http_x_runtime
apptime	Response time from the upstream server	-	$upstream_response_time''';

ltsv ='''recommended_label:time	description:Time the request was received	apache_format:%t	nginx_format:$time_local
recommended_label:host	description:Remote host	apache_format:%h	nginx_format:$remote_addr
recommended_label:forwardedfor	description:X-Forwarded-For header	apache_format:%{X-Forwarded-For}i	nginx_format:$http_x_forwarded_for
recommended_label:ident	description:Remote logname	apache_format:%l	nginx_format:--
recommended_label:user	description:Remote user	apache_format:%u	nginx_format:$remote_user
recommended_label:req	description:First line of request	apache_format:%r	nginx_format:$request
recommended_label:method	description:Request method	apache_format:%m	nginx_format:$request_method
recommended_label:uri	description:Request URI	apache_format:%U%q	nginx_format:$request_uri
recommended_label:protocol	description:Requested Protocol (usually "HTTP/1.0" or "HTTP/1.1")	apache_format:%H	nginx_format:$server_protocol
recommended_label:status	description:Status code	apache_format:%>s	nginx_format:$status
recommended_label:size	description:Size of response in bytes, excluding HTTP headers.	apache_format:%B (or '%b' for compatibility with combined format)	nginx_format:$body_bytes_sent
recommended_label:reqsize	description:Bytes received, including request and headers.	apache_format:%I (mod_log_io required)	nginx_format:$request_length
recommended_label:referer	description:Referer header	apache_format:%{Referer}i	nginx_format:$http_referer
recommended_label:ua	description:User-Agent header	apache_format:%{User-agent}i	nginx_format:$http_user_agent
recommended_label:vhost	description:Host header	apache_format:%{Host}i	nginx_format:$host
recommended_label:reqtime_microsec	description:The time taken to serve the request, in microseconds	apache_format:%D	nginx_format:--
recommended_label:reqtime	description:The time taken to serve the request, in seconds	apache_format:%T	nginx_format:$request_time
recommended_label:cache	description:X-Cache header	apache_format:%{X-Cache}o	nginx_format:$upstream_http_x_cache
recommended_label:runtime	description:Execution time for processing some request, e.g. X-Runtime header for application server or processing time of SQL for DB server.	apache_format:%{X-Runtime}o	nginx_format:$upstream_http_x_runtime
recommended_label:apptime	description:Response time from the upstream server	apache_format:-	nginx_format:$upstream_response_time''';

# write answer code
ltsv_from_tsv = ""
tsv_array = tsv.split("\n")
for tsv in tsv_array:
	tsv_separate = tsv.split("\t")
	for i in range(0, len(labels)):
		ltsv_from_tsv += labels[i] + ":" + tsv_separate[i] + "\t";
	ltsv_from_tsv = ltsv_from_tsv.strip()
	ltsv_from_tsv += "\n"
ltsv_from_tsv = ltsv_from_tsv.strip()

print(ltsv == ltsv_from_tsv); # => print True

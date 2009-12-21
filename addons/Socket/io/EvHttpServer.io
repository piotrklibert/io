
EvHttpRequestHandler := Object clone do(
	handleRequest := method(request, response,
			writeln("EvHttpRequestHandler - you need to override this method")
	        response data = URL with("http://yahoo.com/") fetch size asString
			//response data := ""
			response statusCode := 200
			response responseMessage := "OK"
			response asyncSend
	)
)

EvOutResponse do(
	headers := Map clone
	statusCode := 200
	data := ""
	responseMessage := "OK" // "Internal Server Error"
)

EvHttpServer do(
	eventManager ::= EventManager
	host ::= "127.0.0.1"
	port ::= 80
	
	request := EvHttpRequest clone
	
<<<<<<< HEAD
	response := EvHttpResponse clone
=======
	run := method(
		EventManager run
		start
		self
	)
>>>>>>> 4f3fdd735d94eaab86a343e271f625a6f8357e8b
	
	// response slot is set by EvHttpServer
	
	requestHandlerProto ::= EvHttpRequestHandler
	handleRequestCallback := method(
<<<<<<< HEAD
		writeln("EvHttpServer handleRequestCallback START")
		response = EvHttpResponse clone
		request parse
		//writeln("parameters = ", request parameters keys)
		e := try(self handleRequest(request))
		if(e,
			handleError(e)
		)
		writeln("response data size: ", response data size)
		writeln("EvHttpServer handleRequestCallback END")
		self
	)
	
	handleRequest := method(request,
		writeln("HttpServer handleRequest not implemented")
		response data = ""
		response statusCode := 200
=======
		response headers := Map clone
		request parse
		//writeln("parameters = ", request parameters keys)
		requestHandlerProto clone @handleRequest(request, response)
>>>>>>> 4f3fdd735d94eaab86a343e271f625a6f8357e8b
	)
	
	handleError := method(e,
		response data := "<pre>" .. e coroutine backTraceString .. "</pre>"
		response statusCode := 500
	)
)


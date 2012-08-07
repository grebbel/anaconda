class Anaconda.RestApi
  
  constructor: (@baseUrl) ->
    
  # Utility methods
    
  _absoluteUrl: (relativeUrl) ->
   if @baseUrl 
     "#{@baseUrl}#{relativeUrl}"
   else
    relativeUrl    
    
  sendJson: (method, url, data) ->
    method or= 'POST'
    $.ajax(this._absoluteUrl(url), {
      contentType: 'application/json'
      data: JSON.stringify(data)
      type: method      
    })
  
  putJson: (url, data) ->
    this._sendJson('PUT', url, data)

  postJson: (url, data) ->
    this._sendJson('POST', url, data)
    

Anaconda.api = new Anaconda.RestApi
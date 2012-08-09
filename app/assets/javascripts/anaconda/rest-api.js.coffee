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
    this.sendJson('PUT', url, data)

  postJson: (url, data) ->
    this.sendJson('POST', url, data)
    
  # High-level operations
  
  calculateCt: (ctCalculations) ->
    this.postJson('/calculate_ct', { calculations: ctCalculations })
    
Anaconda.api = new Anaconda.RestApi
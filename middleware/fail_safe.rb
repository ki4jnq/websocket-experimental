class FailSafe
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  rescue
    [500, { 'Content-Type' => 'application/json' }, ['{"error":"500 Internal Server Error"}']] 
  end
end

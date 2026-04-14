import http from 'http'

const server = http.createServer((req, res) => {
  console.log("GOT Request from: ", req.headers.host)
  res.writeHead(200)
  res.write("Hello from APP_1 \n")
  res.end()
})

server.listen(3000, () => {
  console.log("Server started")
})

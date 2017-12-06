require "thrift"
require_relative "service_handlers"
require_relative "./infrastructure/processor_factory"
require_relative "./infrastructure/logging_aspect"
require "aspector"

LoggingAspect = XSS::Infrastructure::LoggingAspect

multiplexed = Thrift::MultiplexedProcessor.new

multiplexed.register_processor(
  XSS::Constants::Service::SupportedFeatures,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::SupportedFeatures::Processor,
    XSS::Handler::SupportedFeatureHandler
  )
)
multiplexed.register_processor(
  XSS::Constants::Service::CloudQueueClient,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudQueueClientService::Processor,
    XSS::Handler::CloudQueueClientHandler
  )
)
multiplexed.register_processor(
  XSS::Constants::Service::CloudQueue,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudQueueService::Processor,
    XSS::Handler::CloudQueueHandler
  )
)

multiplexed.register_processor(
  XSS::Constants::Service::CloudBlob,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudBlobService::Processor,
    XSS::Handler::CloudBlobHandler
  )
)

multiplexed.register_processor(
  XSS::Constants::Service::CloudBlobContainer,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudBlobContainerService::Processor,
    XSS::Handler::CloudBlobContainerHandler
  )
)

multiplexed.register_processor(
  XSS::Constants::Service::CloudPageBlob,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudPageBlobService::Processor,
    XSS::Handler::CloudPageBlobHandler
  )
)

multiplexed.register_processor(
  XSS::Constants::Service::CloudBlockBlob,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudBlockBlobService::Processor,
    XSS::Handler::CloudBlockBlobHandler
  )
)

multiplexed.register_processor(
  XSS::Constants::Service::CloudAppendBlob,
  XSS::Infrastructure::ProcessorFactory.new(
    XSS::AutoGenerated::CloudAppendBlobService::Processor,
    XSS::Handler::CloudAppendBlobHandler
  )
)

transport = Thrift::ServerSocket.new("0.0.0.0", 9993)

server = Thrift::ThreadedServer.new(multiplexed, transport, Thrift::FramedTransportFactory.new, Thrift::BinaryProtocolFactory.new)
LoggingAspect.apply(server)
server.serve()
#
# Auto-generated by Thrift Compiler (0.9.2)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require "thrift"
require_relative "cloud_blob_client_types"

module Azure::Storage::Stress
  module AutoGenerated
    module CloudBlobClientService
      class Client
        include ::Thrift::Client

        def listBlobs(listBlobsPayload, accountInfo)
          send_listBlobs(listBlobsPayload, accountInfo)
          return recv_listBlobs()
        end

        def send_listBlobs(listBlobsPayload, accountInfo)
          send_message("listBlobs", ListBlobs_args, listBlobsPayload: listBlobsPayload, accountInfo: accountInfo)
        end

        def recv_listBlobs()
          result = receive_message(ListBlobs_result)
          return result.success unless result.success.nil?
          raise result.storageException unless result.storageException.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, "listBlobs failed: unknown result")
        end

        def listBlobsSegmented(listBlobsPayload, accountInfo, maxResults, currentToken)
          send_listBlobsSegmented(listBlobsPayload, accountInfo, maxResults, currentToken)
          return recv_listBlobsSegmented()
        end

        def send_listBlobsSegmented(listBlobsPayload, accountInfo, maxResults, currentToken)
          send_message("listBlobsSegmented", ListBlobsSegmented_args, listBlobsPayload: listBlobsPayload, accountInfo: accountInfo, maxResults: maxResults, currentToken: currentToken)
        end

        def recv_listBlobsSegmented()
          result = receive_message(ListBlobsSegmented_result)
          return result.success unless result.success.nil?
          raise result.storageException unless result.storageException.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, "listBlobsSegmented failed: unknown result")
        end

        def listContainers(listContainersPayload, accountInfo)
          send_listContainers(listContainersPayload, accountInfo)
          return recv_listContainers()
        end

        def send_listContainers(listContainersPayload, accountInfo)
          send_message("listContainers", ListContainers_args, listContainersPayload: listContainersPayload, accountInfo: accountInfo)
        end

        def recv_listContainers()
          result = receive_message(ListContainers_result)
          return result.success unless result.success.nil?
          raise result.storageException unless result.storageException.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, "listContainers failed: unknown result")
        end

        def listContainersSegmented(listContainersPayload, accountInfo, maxResults, currentToken)
          send_listContainersSegmented(listContainersPayload, accountInfo, maxResults, currentToken)
          return recv_listContainersSegmented()
        end

        def send_listContainersSegmented(listContainersPayload, accountInfo, maxResults, currentToken)
          send_message("listContainersSegmented", ListContainersSegmented_args, listContainersPayload: listContainersPayload, accountInfo: accountInfo, maxResults: maxResults, currentToken: currentToken)
        end

        def recv_listContainersSegmented()
          result = receive_message(ListContainersSegmented_result)
          return result.success unless result.success.nil?
          raise result.storageException unless result.storageException.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, "listContainersSegmented failed: unknown result")
        end

        def setProperties(thriftRequestOptions, accountInfo, thriftOperationContext, properties)
          send_setProperties(thriftRequestOptions, accountInfo, thriftOperationContext, properties)
          recv_setProperties()
        end

        def send_setProperties(thriftRequestOptions, accountInfo, thriftOperationContext, properties)
          send_message("setProperties", SetProperties_args, thriftRequestOptions: thriftRequestOptions, accountInfo: accountInfo, thriftOperationContext: thriftOperationContext, properties: properties)
        end

        def recv_setProperties()
          result = receive_message(SetProperties_result)
          raise result.storageException unless result.storageException.nil?
          return
        end

        def getProperties(thriftRequestOptions, accountInfo, thriftOperationContext)
          send_getProperties(thriftRequestOptions, accountInfo, thriftOperationContext)
          return recv_getProperties()
        end

        def send_getProperties(thriftRequestOptions, accountInfo, thriftOperationContext)
          send_message("getProperties", GetProperties_args, thriftRequestOptions: thriftRequestOptions, accountInfo: accountInfo, thriftOperationContext: thriftOperationContext)
        end

        def recv_getProperties()
          result = receive_message(GetProperties_result)
          return result.success unless result.success.nil?
          raise result.storageException unless result.storageException.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, "getProperties failed: unknown result")
        end

        def getServiceStats(thriftRequestOptions, accountInfo, thriftOperationContext)
          send_getServiceStats(thriftRequestOptions, accountInfo, thriftOperationContext)
          return recv_getServiceStats()
        end

        def send_getServiceStats(thriftRequestOptions, accountInfo, thriftOperationContext)
          send_message("getServiceStats", GetServiceStats_args, thriftRequestOptions: thriftRequestOptions, accountInfo: accountInfo, thriftOperationContext: thriftOperationContext)
        end

        def recv_getServiceStats()
          result = receive_message(GetServiceStats_result)
          return result.success unless result.success.nil?
          raise result.storageException unless result.storageException.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, "getServiceStats failed: unknown result")
        end
      end

      class Processor
        include ::Thrift::Processor

        def process_listBlobs(seqid, iprot, oprot)
          args = read_args(iprot, ListBlobs_args)
          result = ListBlobs_result.new()
          begin
            result.success = @handler.listBlobs(args.listBlobsPayload, args.accountInfo)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "listBlobs", seqid)
        end

        def process_listBlobsSegmented(seqid, iprot, oprot)
          args = read_args(iprot, ListBlobsSegmented_args)
          result = ListBlobsSegmented_result.new()
          begin
            result.success = @handler.listBlobsSegmented(args.listBlobsPayload, args.accountInfo, args.maxResults, args.currentToken)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "listBlobsSegmented", seqid)
        end

        def process_listContainers(seqid, iprot, oprot)
          args = read_args(iprot, ListContainers_args)
          result = ListContainers_result.new()
          begin
            result.success = @handler.listContainers(args.listContainersPayload, args.accountInfo)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "listContainers", seqid)
        end

        def process_listContainersSegmented(seqid, iprot, oprot)
          args = read_args(iprot, ListContainersSegmented_args)
          result = ListContainersSegmented_result.new()
          begin
            result.success = @handler.listContainersSegmented(args.listContainersPayload, args.accountInfo, args.maxResults, args.currentToken)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "listContainersSegmented", seqid)
        end

        def process_setProperties(seqid, iprot, oprot)
          args = read_args(iprot, SetProperties_args)
          result = SetProperties_result.new()
          begin
            @handler.setProperties(args.thriftRequestOptions, args.accountInfo, args.thriftOperationContext, args.properties)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "setProperties", seqid)
        end

        def process_getProperties(seqid, iprot, oprot)
          args = read_args(iprot, GetProperties_args)
          result = GetProperties_result.new()
          begin
            result.success = @handler.getProperties(args.thriftRequestOptions, args.accountInfo, args.thriftOperationContext)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "getProperties", seqid)
        end

        def process_getServiceStats(seqid, iprot, oprot)
          args = read_args(iprot, GetServiceStats_args)
          result = GetServiceStats_result.new()
          begin
            result.success = @handler.getServiceStats(args.thriftRequestOptions, args.accountInfo, args.thriftOperationContext)
          rescue ::XSS::AutoGenerated::WrappedStorageException => storageException
            result.storageException = storageException
          end
          write_result(result, oprot, "getServiceStats", seqid)
        end
      end

      # HELPER FUNCTIONS AND STRUCTURES

      class ListBlobs_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        LISTBLOBSPAYLOAD = 1
        ACCOUNTINFO = 2

        FIELDS = {
          LISTBLOBSPAYLOAD => { type: ::Thrift::Types::STRUCT, name: "listBlobsPayload", class: ::XSS::AutoGenerated::ListBlobsPayload },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListBlobs_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0
        STORAGEEXCEPTION = 1

        FIELDS = {
          SUCCESS => { type: ::Thrift::Types::STRUCT, name: "success", class: ::XSS::AutoGenerated::ListBlobsResponse },
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListBlobsSegmented_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        LISTBLOBSPAYLOAD = 1
        ACCOUNTINFO = 2
        MAXRESULTS = 3
        CURRENTTOKEN = 4

        FIELDS = {
          LISTBLOBSPAYLOAD => { type: ::Thrift::Types::STRUCT, name: "listBlobsPayload", class: ::XSS::AutoGenerated::ListBlobsPayload },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo },
          MAXRESULTS => { type: ::Thrift::Types::I32, name: "maxResults" },
          CURRENTTOKEN => { type: ::Thrift::Types::STRUCT, name: "currentToken", class: ::XSS::AutoGenerated::ThriftBlobContinuationToken }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListBlobsSegmented_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0
        STORAGEEXCEPTION = 1

        FIELDS = {
          SUCCESS => { type: ::Thrift::Types::STRUCT, name: "success", class: ::XSS::AutoGenerated::ListBlobsResponse },
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListContainers_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        LISTCONTAINERSPAYLOAD = 1
        ACCOUNTINFO = 2

        FIELDS = {
          LISTCONTAINERSPAYLOAD => { type: ::Thrift::Types::STRUCT, name: "listContainersPayload", class: ::XSS::AutoGenerated::ListContainersPayload },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListContainers_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0
        STORAGEEXCEPTION = 1

        FIELDS = {
          SUCCESS => { type: ::Thrift::Types::STRUCT, name: "success", class: ::XSS::AutoGenerated::ListContainersResponse },
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListContainersSegmented_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        LISTCONTAINERSPAYLOAD = 1
        ACCOUNTINFO = 2
        MAXRESULTS = 3
        CURRENTTOKEN = 4

        FIELDS = {
          LISTCONTAINERSPAYLOAD => { type: ::Thrift::Types::STRUCT, name: "listContainersPayload", class: ::XSS::AutoGenerated::ListContainersPayload },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo },
          MAXRESULTS => { type: ::Thrift::Types::I32, name: "maxResults" },
          CURRENTTOKEN => { type: ::Thrift::Types::STRUCT, name: "currentToken", class: ::XSS::AutoGenerated::ThriftBlobContinuationToken }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class ListContainersSegmented_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0
        STORAGEEXCEPTION = 1

        FIELDS = {
          SUCCESS => { type: ::Thrift::Types::STRUCT, name: "success", class: ::XSS::AutoGenerated::ListContainersResponse },
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class SetProperties_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        THRIFTREQUESTOPTIONS = 1
        ACCOUNTINFO = 2
        THRIFTOPERATIONCONTEXT = 3
        PROPERTIES = 4

        FIELDS = {
          THRIFTREQUESTOPTIONS => { type: ::Thrift::Types::STRUCT, name: "thriftRequestOptions", class: ::XSS::AutoGenerated::ThriftBlobRequestOptions },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo },
          THRIFTOPERATIONCONTEXT => { type: ::Thrift::Types::STRUCT, name: "thriftOperationContext", class: ::XSS::AutoGenerated::OperationContext },
          PROPERTIES => { type: ::Thrift::Types::STRUCT, name: "properties", class: ::XSS::AutoGenerated::ThriftStorageServiceProperties }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class SetProperties_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        STORAGEEXCEPTION = 1

        FIELDS = {
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class GetProperties_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        THRIFTREQUESTOPTIONS = 1
        ACCOUNTINFO = 2
        THRIFTOPERATIONCONTEXT = 3

        FIELDS = {
          THRIFTREQUESTOPTIONS => { type: ::Thrift::Types::STRUCT, name: "thriftRequestOptions", class: ::XSS::AutoGenerated::ThriftBlobRequestOptions },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo },
          THRIFTOPERATIONCONTEXT => { type: ::Thrift::Types::STRUCT, name: "thriftOperationContext", class: ::XSS::AutoGenerated::OperationContext }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class GetProperties_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0
        STORAGEEXCEPTION = 1

        FIELDS = {
          SUCCESS => { type: ::Thrift::Types::STRUCT, name: "success", class: ::XSS::AutoGenerated::ThriftStorageServiceProperties },
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class GetServiceStats_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        THRIFTREQUESTOPTIONS = 1
        ACCOUNTINFO = 2
        THRIFTOPERATIONCONTEXT = 3

        FIELDS = {
          THRIFTREQUESTOPTIONS => { type: ::Thrift::Types::STRUCT, name: "thriftRequestOptions", class: ::XSS::AutoGenerated::ThriftBlobRequestOptions },
          ACCOUNTINFO => { type: ::Thrift::Types::STRUCT, name: "accountInfo", class: ::XSS::AutoGenerated::StorageAccountInfo },
          THRIFTOPERATIONCONTEXT => { type: ::Thrift::Types::STRUCT, name: "thriftOperationContext", class: ::XSS::AutoGenerated::OperationContext }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class GetServiceStats_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0
        STORAGEEXCEPTION = 1

        FIELDS = {
          SUCCESS => { type: ::Thrift::Types::STRUCT, name: "success", class: ::XSS::AutoGenerated::ThriftServiceStats },
          STORAGEEXCEPTION => { type: ::Thrift::Types::STRUCT, name: "storageException", class: ::XSS::AutoGenerated::WrappedStorageException }
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end
    end
  end
end
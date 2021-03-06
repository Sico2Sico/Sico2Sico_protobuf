/// Generated by the Protocol Buffers 3.3.0 compiler.  DO NOT EDIT!
/// Protobuf-swift version: 3.0.14
/// Source file "timestamp.proto"
/// Syntax "Proto3"

import Foundation

public extension Google.Protobuf{}

public extension Google.Protobuf {
    public struct TimestampRoot {
        public static let `default` = TimestampRoot()
        public var extensionRegistry:ExtensionRegistry

        init() {
            extensionRegistry = ExtensionRegistry()
            registerAllExtensions(registry: extensionRegistry)
            Google.Protobuf.SwiftDescriptorRoot.default.registerAllExtensions(registry: extensionRegistry)
        }
        public func registerAllExtensions(registry: ExtensionRegistry) {
        }
    }

    /// A Timestamp represents a point in time independent of any time zone
    /// or calendar, represented as seconds and fractions of seconds at
    /// nanosecond resolution in UTC Epoch time. It is encoded using the
    /// Proleptic Gregorian Calendar which extends the Gregorian calendar
    /// backwards to year one. It is encoded assuming all minutes are 60
    /// seconds long, i.e. leap seconds are "smeared" so that no leap second
    /// table is needed for interpretation. Range is from
    /// 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z.
    /// By restricting to that range, we ensure that we can convert to
    /// and from  RFC 3339 date strings.
    /// See [https://www.ietf.org/rfc/rfc3339.txt](https://www.ietf.org/rfc/rfc3339.txt).
    /// Example 1: Compute Timestamp from POSIX `time()`.
    ///     Timestamp timestamp;
    ///     timestamp.set_seconds(time(NULL));
    ///     timestamp.set_nanos(0);
    /// Example 2: Compute Timestamp from POSIX `gettimeofday()`.
    ///     struct timeval tv;
    ///     gettimeofday(&tv, NULL);
    ///     Timestamp timestamp;
    ///     timestamp.set_seconds(tv.tv_sec);
    ///     timestamp.set_nanos(tv.tv_usec * 1000);
    /// Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.
    ///     FILETIME ft;
    ///     GetSystemTimeAsFileTime(&ft);
    ///     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;
    ///     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z
    ///     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.
    ///     Timestamp timestamp;
    ///     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));
    ///     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));
    /// Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.
    ///     long millis = System.currentTimeMillis();
    ///     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)
    ///         .setNanos((int) ((millis % 1000) * 1000000)).build();
    /// Example 5: Compute Timestamp from Python `datetime.datetime`.
    ///     now = datetime.datetime.utcnow()
    ///     seconds = int(time.mktime(now.timetuple()))
    ///     nanos = now.microsecond * 1000
    ///     timestamp = Timestamp(seconds=seconds, nanos=nanos)
    final public class Timestamp : GeneratedMessage {

        public static func == (lhs: Google.Protobuf.Timestamp, rhs: Google.Protobuf.Timestamp) -> Bool {
            if lhs === rhs {
                return true
            }
            var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
            fieldCheck = fieldCheck && (lhs.hasSeconds == rhs.hasSeconds) && (!lhs.hasSeconds || lhs.seconds == rhs.seconds)
            fieldCheck = fieldCheck && (lhs.hasNanos == rhs.hasNanos) && (!lhs.hasNanos || lhs.nanos == rhs.nanos)
            fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
            return fieldCheck
        }

        /// Represents seconds of UTC time since Unix epoch
        /// 1970-01-01T00:00:00Z. Must be from from 0001-01-01T00:00:00Z to
        /// 9999-12-31T23:59:59Z inclusive.
        public fileprivate(set) var seconds:Int64! = nil
        public fileprivate(set) var hasSeconds:Bool = false

        /// Non-negative fractions of a second at nanosecond resolution. Negative
        /// second values with fractions must still have non-negative nanos values
        /// that count forward in time. Must be from 0 to 999,999,999
        /// inclusive.
        public fileprivate(set) var nanos:Int32! = nil
        public fileprivate(set) var hasNanos:Bool = false

        required public init() {
            super.init()
        }
        override public func isInitialized() -> Bool {
            return true
        }
        override public func writeTo(codedOutputStream: CodedOutputStream) throws {
            if hasSeconds {
                try codedOutputStream.writeInt64(fieldNumber: 1, value:seconds)
            }
            if hasNanos {
                try codedOutputStream.writeInt32(fieldNumber: 2, value:nanos)
            }
            try unknownFields.writeTo(codedOutputStream: codedOutputStream)
        }
        override public func serializedSize() -> Int32 {
            var serialize_size:Int32 = memoizedSerializedSize
            if serialize_size != -1 {
             return serialize_size
            }

            serialize_size = 0
            if hasSeconds {
                serialize_size += seconds.computeInt64Size(fieldNumber: 1)
            }
            if hasNanos {
                serialize_size += nanos.computeInt32Size(fieldNumber: 2)
            }
            serialize_size += unknownFields.serializedSize()
            memoizedSerializedSize = serialize_size
            return serialize_size
        }
        public class func getBuilder() -> Google.Protobuf.Timestamp.Builder {
            return Google.Protobuf.Timestamp.classBuilder() as! Google.Protobuf.Timestamp.Builder
        }
        public func getBuilder() -> Google.Protobuf.Timestamp.Builder {
            return classBuilder() as! Google.Protobuf.Timestamp.Builder
        }
        override public class func classBuilder() -> ProtocolBuffersMessageBuilder {
            return Google.Protobuf.Timestamp.Builder()
        }
        override public func classBuilder() -> ProtocolBuffersMessageBuilder {
            return Google.Protobuf.Timestamp.Builder()
        }
        public func toBuilder() throws -> Google.Protobuf.Timestamp.Builder {
            return try Google.Protobuf.Timestamp.builderWithPrototype(prototype:self)
        }
        public class func builderWithPrototype(prototype:Google.Protobuf.Timestamp) throws -> Google.Protobuf.Timestamp.Builder {
            return try Google.Protobuf.Timestamp.Builder().mergeFrom(other:prototype)
        }
        override public func encode() throws -> Dictionary<String,Any> {
            guard isInitialized() else {
                throw ProtocolBuffersError.invalidProtocolBuffer("Uninitialized Message")
            }

            var jsonMap:Dictionary<String,Any> = Dictionary<String,Any>()
            if hasSeconds {
                jsonMap["seconds"] = "\(seconds)"
            }
            if hasNanos {
                jsonMap["nanos"] = Int(nanos)
            }
            return jsonMap
        }
        override class public func decode(jsonMap:Dictionary<String,Any>) throws -> Google.Protobuf.Timestamp {
            return try Google.Protobuf.Timestamp.Builder.decodeToBuilder(jsonMap:jsonMap).build()
        }
        override class public func fromJSON(data:Data) throws -> Google.Protobuf.Timestamp {
            return try Google.Protobuf.Timestamp.Builder.fromJSONToBuilder(data:data).build()
        }
        override public func getDescription(indent:String) throws -> String {
            var output = ""
            if hasSeconds {
                output += "\(indent) seconds: \(seconds) \n"
            }
            if hasNanos {
                output += "\(indent) nanos: \(nanos) \n"
            }
            output += unknownFields.getDescription(indent: indent)
            return output
        }
        override public var hashValue:Int {
            get {
                var hashCode:Int = 7
                if hasSeconds {
                    hashCode = (hashCode &* 31) &+ seconds.hashValue
                }
                if hasNanos {
                    hashCode = (hashCode &* 31) &+ nanos.hashValue
                }
                hashCode = (hashCode &* 31) &+  unknownFields.hashValue
                return hashCode
            }
        }


        //Meta information declaration start

        override public class func className() -> String {
            return "Google.Protobuf.Timestamp"
        }
        override public func className() -> String {
            return "Google.Protobuf.Timestamp"
        }
        //Meta information declaration end

        final public class Builder : GeneratedMessageBuilder {
            fileprivate var builderResult:Google.Protobuf.Timestamp = Google.Protobuf.Timestamp()
            public func getMessage() -> Google.Protobuf.Timestamp {
                return builderResult
            }

            required override public init () {
                super.init()
            }
            /// Represents seconds of UTC time since Unix epoch
            /// 1970-01-01T00:00:00Z. Must be from from 0001-01-01T00:00:00Z to
            /// 9999-12-31T23:59:59Z inclusive.
            public var seconds:Int64 {
                get {
                    return builderResult.seconds
                }
                set (value) {
                    builderResult.hasSeconds = true
                    builderResult.seconds = value
                }
            }
            public var hasSeconds:Bool {
                get {
                    return builderResult.hasSeconds
                }
            }
            @discardableResult
            public func setSeconds(_ value:Int64) -> Google.Protobuf.Timestamp.Builder {
                self.seconds = value
                return self
            }
            @discardableResult
            public func clearSeconds() -> Google.Protobuf.Timestamp.Builder{
                builderResult.hasSeconds = false
                builderResult.seconds = nil
                return self
            }
            /// Non-negative fractions of a second at nanosecond resolution. Negative
            /// second values with fractions must still have non-negative nanos values
            /// that count forward in time. Must be from 0 to 999,999,999
            /// inclusive.
            public var nanos:Int32 {
                get {
                    return builderResult.nanos
                }
                set (value) {
                    builderResult.hasNanos = true
                    builderResult.nanos = value
                }
            }
            public var hasNanos:Bool {
                get {
                    return builderResult.hasNanos
                }
            }
            @discardableResult
            public func setNanos(_ value:Int32) -> Google.Protobuf.Timestamp.Builder {
                self.nanos = value
                return self
            }
            @discardableResult
            public func clearNanos() -> Google.Protobuf.Timestamp.Builder{
                builderResult.hasNanos = false
                builderResult.nanos = nil
                return self
            }
            override public var internalGetResult:GeneratedMessage {
                get {
                    return builderResult
                }
            }
            @discardableResult
            override public func clear() -> Google.Protobuf.Timestamp.Builder {
                builderResult = Google.Protobuf.Timestamp()
                return self
            }
            override public func clone() throws -> Google.Protobuf.Timestamp.Builder {
                return try Google.Protobuf.Timestamp.builderWithPrototype(prototype:builderResult)
            }
            override public func build() throws -> Google.Protobuf.Timestamp {
                try checkInitialized()
                return buildPartial()
            }
            public func buildPartial() -> Google.Protobuf.Timestamp {
                let returnMe:Google.Protobuf.Timestamp = builderResult
                return returnMe
            }
            @discardableResult
            public func mergeFrom(other:Google.Protobuf.Timestamp) throws -> Google.Protobuf.Timestamp.Builder {
                if other == Google.Protobuf.Timestamp() {
                    return self
                }
                if other.hasSeconds {
                    seconds = other.seconds
                }
                if other.hasNanos {
                    nanos = other.nanos
                }
                try merge(unknownField: other.unknownFields)
                return self
            }
            @discardableResult
            override public func mergeFrom(codedInputStream: CodedInputStream) throws -> Google.Protobuf.Timestamp.Builder {
                return try mergeFrom(codedInputStream: codedInputStream, extensionRegistry:ExtensionRegistry())
            }
            @discardableResult
            override public func mergeFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.Timestamp.Builder {
                let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(copyFrom:self.unknownFields)
                while (true) {
                    let protobufTag = try codedInputStream.readTag()
                    switch protobufTag {
                    case 0: 
                        self.unknownFields = try unknownFieldsBuilder.build()
                        return self

                    case 8:
                        seconds = try codedInputStream.readInt64()

                    case 16:
                        nanos = try codedInputStream.readInt32()

                    default:
                        if (!(try parse(codedInputStream:codedInputStream, unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:protobufTag))) {
                            unknownFields = try unknownFieldsBuilder.build()
                            return self
                        }
                    }
                }
            }
            class override public func decodeToBuilder(jsonMap:Dictionary<String,Any>) throws -> Google.Protobuf.Timestamp.Builder {
                let resultDecodedBuilder = Google.Protobuf.Timestamp.Builder()
                if let jsonValueSeconds = jsonMap["seconds"] as? String {
                    resultDecodedBuilder.seconds = Int64(jsonValueSeconds)!
                } else if let jsonValueSeconds = jsonMap["seconds"] as? Int {
                    resultDecodedBuilder.seconds = Int64(jsonValueSeconds)
                }
                if let jsonValueNanos = jsonMap["nanos"] as? Int {
                    resultDecodedBuilder.nanos = Int32(jsonValueNanos)
                } else if let jsonValueNanos = jsonMap["nanos"] as? String {
                    resultDecodedBuilder.nanos = Int32(jsonValueNanos)!
                }
                return resultDecodedBuilder
            }
            override class public func fromJSONToBuilder(data:Data) throws -> Google.Protobuf.Timestamp.Builder {
                let jsonData = try JSONSerialization.jsonObject(with:data, options: JSONSerialization.ReadingOptions(rawValue: 0))
                guard let jsDataCast = jsonData as? Dictionary<String,Any> else {
                  throw ProtocolBuffersError.invalidProtocolBuffer("Invalid JSON data")
                }
                return try Google.Protobuf.Timestamp.Builder.decodeToBuilder(jsonMap:jsDataCast)
            }
        }

    }

}
extension Google.Protobuf.Timestamp: GeneratedMessageProtocol {
    public class func parseArrayDelimitedFrom(inputStream: InputStream) throws -> Array<Google.Protobuf.Timestamp> {
        var mergedArray = Array<Google.Protobuf.Timestamp>()
        while let value = try parseDelimitedFrom(inputStream: inputStream) {
          mergedArray.append(value)
        }
        return mergedArray
    }
    public class func parseDelimitedFrom(inputStream: InputStream) throws -> Google.Protobuf.Timestamp? {
        return try Google.Protobuf.Timestamp.Builder().mergeDelimitedFrom(inputStream: inputStream)?.build()
    }
    public class func parseFrom(data: Data) throws -> Google.Protobuf.Timestamp {
        return try Google.Protobuf.Timestamp.Builder().mergeFrom(data: data, extensionRegistry:Google.Protobuf.TimestampRoot.default.extensionRegistry).build()
    }
    public class func parseFrom(data: Data, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.Timestamp {
        return try Google.Protobuf.Timestamp.Builder().mergeFrom(data: data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(inputStream: InputStream) throws -> Google.Protobuf.Timestamp {
        return try Google.Protobuf.Timestamp.Builder().mergeFrom(inputStream: inputStream).build()
    }
    public class func parseFrom(inputStream: InputStream, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.Timestamp {
        return try Google.Protobuf.Timestamp.Builder().mergeFrom(inputStream: inputStream, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream) throws -> Google.Protobuf.Timestamp {
        return try Google.Protobuf.Timestamp.Builder().mergeFrom(codedInputStream: codedInputStream).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Google.Protobuf.Timestamp {
        return try Google.Protobuf.Timestamp.Builder().mergeFrom(codedInputStream: codedInputStream, extensionRegistry:extensionRegistry).build()
    }
    public subscript(key: String) -> Any? {
        switch key {
        case "seconds": return self.seconds
        case "nanos": return self.nanos
        default: return nil
        }
    }
}
extension Google.Protobuf.Timestamp.Builder: GeneratedMessageBuilderProtocol {
    public subscript(key: String) -> Any? {
        get { 
            switch key {
            case "seconds": return self.seconds
            case "nanos": return self.nanos
            default: return nil
            }
        }
        set (newSubscriptValue) { 
            switch key {
            case "seconds":
                guard let newSubscriptValue = newSubscriptValue as? Int64 else {
                    return
                }
                self.seconds = newSubscriptValue
            case "nanos":
                guard let newSubscriptValue = newSubscriptValue as? Int32 else {
                    return
                }
                self.nanos = newSubscriptValue
            default: return
            }
        }
    }
}

// @@protoc_insertion_point(global_scope)

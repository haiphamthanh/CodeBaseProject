//
//  ServerTrustManager.swift
//  CodeBaseProject
//
//  Created by HaiKaito on 24/03/2022.
//

import Foundation

/// A protocol describing the API used to evaluate server trusts.
public protocol ServerTrustEvaluating {
	#if os(Linux) || os(Windows)
	// Implement this once Linux/Windows has API for evaluating server trusts.
	#else
	/// Evaluates the given `SecTrust` value for the given `host`.
	///
	/// - Parameters:
	///   - trust: The `SecTrust` value to evaluate.
	///   - host:  The host for which to evaluate the `SecTrust` value.
	///
	/// - Returns: A `Bool` indicating whether the evaluator considers the `SecTrust` value valid for `host`.
	func evaluate(_ trust: SecTrust, forHost host: String) throws
	#endif
}


/// An evaluator which Uses the default and revoked server trust evaluations allowing you to control whether to validate
/// the host provided by the challenge as well as specify the revocation flags for testing for revoked certificates.
/// Apple platforms did not start testing for revoked certificates automatically until iOS 10.1, macOS 10.12 and tvOS
/// 10.1 which is demonstrated in our TLS tests. Applications are encouraged to always validate the host in production
/// environments to guarantee the validity of the server's certificate chain.
public final class RevocationTrustEvaluator: ServerTrustEvaluating {
	public func evaluate(_ trust: SecTrust, forHost host: String) throws {
		//
	}
	
	/// Represents the options to be use when evaluating the status of a certificate.
	/// Only Revocation Policy Constants are valid, and can be found in [Apple's documentation](https://developer.apple.com/documentation/security/certificate_key_and_trust_services/policies/1563600-revocation_policy_constants).
	public struct Options: OptionSet {
		/// Perform revocation checking using the CRL (Certification Revocation List) method.
		public static let crl = Options(rawValue: kSecRevocationCRLMethod)
		/// Consult only locally cached replies; do not use network access.
		public static let networkAccessDisabled = Options(rawValue: kSecRevocationNetworkAccessDisabled)
		/// Perform revocation checking using OCSP (Online Certificate Status Protocol).
		public static let ocsp = Options(rawValue: kSecRevocationOCSPMethod)
		/// Prefer CRL revocation checking over OCSP; by default, OCSP is preferred.
		public static let preferCRL = Options(rawValue: kSecRevocationPreferCRL)
		/// Require a positive response to pass the policy. If the flag is not set, revocation checking is done on a
		/// "best attempt" basis, where failure to reach the server is not considered fatal.
		public static let requirePositiveResponse = Options(rawValue: kSecRevocationRequirePositiveResponse)
		/// Perform either OCSP or CRL checking. The checking is performed according to the method(s) specified in the
		/// certificate and the value of `preferCRL`.
		public static let any = Options(rawValue: kSecRevocationUseAnyAvailableMethod)

		/// The raw value of the option.
		public let rawValue: CFOptionFlags

		/// Creates an `Options` value with the given `CFOptionFlags`.
		///
		/// - Parameter rawValue: The `CFOptionFlags` value to initialize with.
		public init(rawValue: CFOptionFlags) {
			self.rawValue = rawValue
		}
	}

	private let performDefaultValidation: Bool
	private let validateHost: Bool
	private let options: Options

	/// Creates a `RevocationTrustEvaluator`.
	///
	/// - Note: Default and host validation will fail when using this evaluator with self-signed certificates. Use
	///         `PinnedCertificatesTrustEvaluator` if you need to use self-signed certificates.
	///
	/// - Parameters:
	///   - performDefaultValidation:     Determines whether default validation should be performed in addition to
	///                                   evaluating the pinned certificates. `true` by default.
	///   - validateHost:                 Determines whether or not the evaluator should validate the host, in addition
	///                                   to performing the default evaluation, even if `performDefaultValidation` is
	///                                   `false`. `true` by default.
	///   - options:                      The `Options` to use to check the revocation status of the certificate. `.any`
	///                                   by default.
	public init(performDefaultValidation: Bool = true, validateHost: Bool = true, options: Options = .any) {
		self.performDefaultValidation = performDefaultValidation
		self.validateHost = validateHost
		self.options = options
	}
}

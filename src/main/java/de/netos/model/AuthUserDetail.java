package de.netos.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class AuthUserDetail implements UserDetails {

	private final User user;
	
	public AuthUserDetail(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
		
		user.getAuthorities().forEach(authority -> {
			grantedAuthorities.add(new SimpleGrantedAuthority(authority.getName()));

		});
		return grantedAuthorities;
	}
	
	@Override
	public String getUsername() {
		return user.getUsername();
	}
	
	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public boolean isAccountNonExpired() {
		return user.isAccountNonExpired();
	}

	@Override
	public boolean isAccountNonLocked() {
		return user.isAccountNonLocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		LocalDate expiryDate = user.getCredentialsExpiryDate();
		return expiryDate.isAfter(LocalDate.now());
	}

	@Override
	public boolean isEnabled() {
		return user.isEnabled();
	}
}

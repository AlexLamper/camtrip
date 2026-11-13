import shapes from '@/data/countries-110m.json';
import { countryAt, type CountryShape } from './trip-map';

// Offline reverse geocoding to a country only (no city names, no outside
// service): data/countries-110m.json is Natural Earth 110m admin-0 countries
// (public domain, naturalearthdata.com), compacted to ~140 KB.
// Results are cached per ~1 km cell, which repeats a lot on a trip.

const cache = new Map<string, string | null>();
const CACHE_MAX = 5000;

export function countryCodeFor(lat: number, lng: number): string | null {
  const key = `${lat.toFixed(2)},${lng.toFixed(2)}`;
  const hit = cache.get(key);
  if (hit !== undefined) return hit;
  const code = countryAt(shapes as unknown as CountryShape[], lat, lng);
  if (cache.size >= CACHE_MAX) cache.clear();
  cache.set(key, code);
  return code;
}

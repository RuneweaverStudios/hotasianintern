#!/bin/bash
# Verification script for context7 optimization and adaptive testing improvements

echo "🔍 Verifying hotAsianIntern improvements..."
echo

# Check if context7 skip list exists in SKILL.md
echo "1. Checking context7 skip list..."
if grep -q "Skip list" SKILL.md; then
    echo "   ✅ Skip list found in SKILL.md"
else
    echo "   ❌ Skip list NOT found in SKILL.md"
    exit 1
fi

# Check if well-known frameworks are listed
echo "2. Checking well-known frameworks..."
FRAMEWORKS="React\|Vue\|Angular\|Express\|Django\|pandas\|Android Compose\|SwiftUI"
if grep -q "$FRAMEWORKS" SKILL.md; then
    echo "   ✅ Well-known frameworks listed"
else
    echo "   ❌ Well-known frameworks NOT listed"
    exit 1
fi

# Check if adaptive testing section exists
echo "3. Checking adaptive testing..."
if grep -q "Adaptive Testing" SKILL.md; then
    echo "   ✅ Adaptive Testing section found"
else
    echo "   ❌ Adaptive Testing section NOT found"
    exit 1
fi

# Check if testing strategy is defined
echo "4. Checking testing strategy..."
if grep -q "Full TDD" SKILL.md && grep -q "Smoke tests only" SKILL.md; then
    echo "   ✅ Testing strategy defined"
else
    echo "   ❌ Testing strategy NOT defined"
    exit 1
fi

# Check if mei-dev.md has the improvements
echo "5. Checking mei-dev.md improvements..."
if grep -q "Adaptive TDD" references/mei-dev.md; then
    echo "   ✅ Adaptive TDD in mei-dev.md"
else
    echo "   ❌ Adaptive TDD NOT in mei-dev.md"
    exit 1
fi

# Check if well-known frameworks are in mei-dev.md
echo "6. Checking mei-dev.md framework list..."
if grep -q "Well-Known Frameworks" references/mei-dev.md; then
    echo "   ✅ Well-known frameworks section in mei-dev.md"
else
    echo "   ❌ Well-known frameworks section NOT in mei-dev.md"
    exit 1
fi

echo
echo "✅ All improvements verified successfully!"
echo
echo "Expected impact:"
echo "  - Binance: +35% → ~0% (smoke tests instead of full TDD)"
echo "  - yfinance: +40% → ~0% (skip pandas context7)"
echo "  - OAuth: +11% → +5% (security keeps context7, leaner testing)"
echo "  - Android: +9% → ~0% (skip Compose context7)"

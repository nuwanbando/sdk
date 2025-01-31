/*
 * Copyright (c) 2019 WSO2 Inc. (http:www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package error

import (
	"fmt"
	"regexp"
)

func IsCellInstanceNotFoundError(srcInst string, cellErr error) (bool, error) {
	matches, err := regexp.MatchString(buildCellInstanceNonExistErrorMatcher(srcInst),
		cellErr.Error())
	if err != nil {
		return false, err
	}
	return matches, nil
}

func buildCellInstanceNonExistErrorMatcher(name string) string {
	return fmt.Sprintf("cell(.)+(%s)(.)+not found", name)
}

type CellGwApiVersionMismatchError struct {
	CurrentTargetInstance   string
	NewTargetInstance       string
	CurrentTargetApiContext string
	CurrentTargetApiVersion string
}

func (err CellGwApiVersionMismatchError) Error() string {
	return fmt.Sprintf("Version mismatch between gateway APIs exposed in instances %s and %s", err.CurrentTargetInstance, err.NewTargetInstance)
}

-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 515.550476 , 150.819504 , 9.192261 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(495.362,163.381,10.582);]] )
   Camera:MotionSpline_AddSplinePoint( 516.779114 , 153.768600 , 9.082261 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(495.362,163.381,10.582);]] )
   Camera:MotionSpline_AddSplinePoint( 516.331482 , 157.181870 , 9.782261 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(495.362,163.381,10.582);]] )
   Camera:MotionSpline_AddSplinePoint( 514.412476 , 158.576233 , 9.802260 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(495.362,163.381,10.582);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )

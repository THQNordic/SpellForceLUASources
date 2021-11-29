-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 590.124329 , 112.012772 , 23.442369 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(645.989,86.560,24.410);]] )
   Camera:MotionSpline_AddSplinePoint( 579.765869 , 127.985626 , 23.072371 , 12.500011 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 559.773254 , 146.391754 , 23.012369 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 549.051941 , 153.584061 , 23.318583 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )

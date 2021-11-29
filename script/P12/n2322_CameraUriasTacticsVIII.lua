-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 440.700073 , 339.700439 , 23.033876 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(380.871,392.053,40.910);]] )
   Camera:MotionSpline_AddSplinePoint( 445.495819 , 341.616547 , 23.503876 , 6.799996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.452148 , 345.542084 , 25.964962 , 14.800020 , [[Camera:ScriptSplineLookAtPosition(417.646,368.577,25.020);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 449.950958 , 358.148804 , 30.323900 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )

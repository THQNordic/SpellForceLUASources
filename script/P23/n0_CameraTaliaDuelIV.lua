-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 617.722107 , 287.300018 , 31.246193 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3737);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2.5);]] )
   Camera:MotionSpline_AddSplinePoint( 616.716248 , 285.648926 , 30.956192 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 616.044250 , 284.329956 , 30.825218 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 616.076050 , 282.296844 , 30.815220 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
